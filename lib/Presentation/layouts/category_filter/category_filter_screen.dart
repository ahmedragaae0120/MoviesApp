import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/category_filter/view_model/category_filter_view_model.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/data/models/categories/Genres.dart';
import 'package:movies_app/domain/entities/FilterEntitie.dart';

import '../../../core/Utils/routes.dart';

class CategoryFilterScreen extends StatelessWidget {
  const CategoryFilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Genres category = ModalRoute.of(context)?.settings.arguments as Genres;
    return BlocProvider<CategoryFilterViewModel>(
      create: (context) => getIt<CategoryFilterViewModel>()
        ..filter(categoryId: category.id!.toInt()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${category.name}"),
        ),
        body: BlocBuilder<CategoryFilterViewModel, CategoryFilterStates>(
          builder: (context, state) {
            if (state is CategoryFilterSuccessState) {
              List<FilterEntitie> movies = state.filter;
              movies[0].backdropPath;
              return GridView.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.movieDetailsScreenRouteName,
                      arguments: SelectedMovie(
                          id: movies[index].id ?? 0,
                          title: movies[index].title ?? ""),
                    );
                  },
                  child: MovieCard(isFullView: false, movie: movies[index]),
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 15.w,
                  mainAxisExtent: 250.h,
                ),
                itemCount: movies.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(16.sp),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          },
        ),
      ),
    );
  }
}
