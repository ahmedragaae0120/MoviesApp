import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/home/tabs/home_tab/view_model/upcoming_home_tab_view_model.dart';
import 'package:movies_app/core/DI/Di.dart';

import '../../../../../../core/Utils/routes.dart';
import '../../../../../../core/reusable components/movie_card.dart';

class ReleasesWidget extends StatelessWidget {
  const ReleasesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpcomingHomeTabViewModel>()..getUpcoming(),
      child: Container(
        height: 230.h,
        width: 434.w,
        color: Theme.of(context).colorScheme.onBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 8.sp),
              child: Text("New Releases",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 15.sp),
                  textAlign: TextAlign.start),
            ),
            SizedBox(height: 15.h),
            BlocBuilder<UpcomingHomeTabViewModel, UpcomingHomeTabStates>(
              builder: (context, state) {
                if (state is UpcomingHomeTabSuccessState) {
                  var movies = state.upcoming;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Material(
                                borderRadius: BorderRadius.circular(5.r),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.movieDetailsScreenRouteName,
                                        arguments: SelectedMovie(
                                            id: movies[index].id ?? 0,
                                            title: movies[index].title ?? ""));
                                  },
                                  child: MovieCard(
                                      movie: movies[index],
                                      isFullView: true,
                                      isLarge: false),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 12.w),
                          itemCount: movies.length),
                    ),
                  );
                }
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              },
            ),
            SizedBox(height: 17.h)
          ],
        ),
      ),
    );
  }
}
