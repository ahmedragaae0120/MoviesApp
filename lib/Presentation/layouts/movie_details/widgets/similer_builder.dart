import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/movie_details/view_model/similer_view_model.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';

// ignore: must_be_immutable
class SimilerBuilder extends StatelessWidget {
  SimilerBuilder({super.key, required this.movie});
  var movie;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SimilerHomeTabViewModel>()..getSimiler(movieId: movie.id),
      child: BlocBuilder<SimilerHomeTabViewModel, SimilerHomeTabStates>(
        builder: (context, state) {
          if (state is SimilerHomeTabSuccessState) {
            var movies = state.similer;
            return Container(
              height: 300.h,
              width: 434.w,
              color: Theme.of(context).colorScheme.onBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text("More Like This",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontSize: 15.sp),
                        textAlign: TextAlign.start),
                  ),
                  SizedBox(height: 15.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Material(
                              borderRadius: BorderRadius.circular(5),
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context,
                                      Routes.movieDetailsScreenRouteName,
                                      arguments: SelectedMovie(
                                          id: movies[index].id ?? 0,
                                          title: movies[index].title ?? ""));
                                },
                                child: MovieCard(
                                      movie: movies[index],
                                      isFullView: false,
                                    ),
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 10.w),
                            itemCount: movies.length),
                      ),
                    ),
                  ),
                  SizedBox(height: 17.h)
                ],
              ),
            );
          }
          if (state is SimilerHomeTabErrorState) {
            return Column(
              children: [
                Text(
                    "something wrong you have error (${state.error.toString()})"),
              ],
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
