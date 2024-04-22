import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/reusable%20components/book_mark_widget.dart';
import 'package:movies_app/core/reusable%20components/movie_show_details.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MovieCard extends StatelessWidget {
  late double height;
  late double width;
  bool isFullView;
  bool? isLarge;
  var movie;

  MovieCard({
    super.key,
    required this.isFullView,
    this.isLarge,
    required this.movie,
  }) {
    if (isFullView) {
      if (isLarge ?? false) {
        height = 200.h;
        width = 130.w;
      } else {
        height = 170.h;
        width = 100.w;
      }
    } else {
      height = 270.h;
      width = 120.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Stack(alignment: Alignment.topLeft, children: [
      Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(5.r)),
        child: isFullView
            ? CachedNetworkImage(
                imageUrl: "${Constants.imageBasePath}${movie.backdropPath}",
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                errorWidget: (context, url, error) => Container(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Constants.imageBasePath}${movie.backdropPath}",
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Container(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star_rate_rounded,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 15.sp),
                                SizedBox(width: 2.w),
                                Text(movie.voteAverage.toString(),
                                    style:
                                        Theme.of(context).textTheme.titleSmall)
                              ],
                            ),
                            Text(
                              movie.title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(fontSize: 10),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2.h),
                            MovieSmallDetails(
                              movieId: movie.id,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontSize: 8),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
      ),
      BookMarkWidget(authProvider: authProvider, movie: movie)
    ]);
  }
}

class SelectedMovie {
  String title;
  num id;
  SelectedMovie({required this.id, required this.title});
}
