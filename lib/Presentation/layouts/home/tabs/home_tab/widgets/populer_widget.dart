import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/movie_show_details.dart';
import 'package:movies_app/domain/entities/PopularEntitie.dart';

class populer_widget extends StatelessWidget {
  const populer_widget({super.key, required this.popular});
  final PopularEntitie popular;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.movieDetailsScreenRouteName,
            arguments:
                SelectedMovie(id: popular.id ?? 0, title: popular.title ?? ""));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(
            height: 230.h,
            image:
                NetworkImage("${Constants.imageBasePath}${popular.posterPath}"),
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(top: 150.h, left: 16.w),
            child: Row(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(4.r),
                  clipBehavior: Clip.antiAlias,
                  child: MovieCard(
                    isFullView: true,
                    movie: popular,
                    isLarge: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popular.title ?? "",
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 15.sp),
                      ),
                      MovieSmallDetails(
                        movieId: popular.id ?? 0,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
