import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/Utils/routes.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/core/reusable%20components/movie_card.dart';
import 'package:movies_app/core/reusable%20components/movie_show_details.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MovieWidgetForSearchAndWatchList extends StatelessWidget {
  MovieWidgetForSearchAndWatchList(
      {super.key, required this.movie, required this.isSearchTab});

  var movie;
  final bool isSearchTab;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return InkWell(
      onTap: () {
         Navigator.pushNamed(context, Routes.movieDetailsScreenRouteName,
            arguments:
                SelectedMovie(id: movie.id ?? 0, title: movie.title ?? ""));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          children: [
            SizedBox(
              height: 100.h,
              width: 150.w,
              child: Material(
                borderRadius: BorderRadius.circular(5.r),
                clipBehavior: Clip.antiAlias,
                child: isSearchTab
                    ? CachedNetworkImage(
                        imageUrl:
                            "${Constants.imageBasePath}${movie.backdropPath}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      )
                    : Stack(
                        fit: StackFit.expand,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "${Constants.imageBasePath}${movie.backdropPath}",
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () {
                                
                                FireStoreHelper.deleteMovie(
                                    userId: authProvider.fireBaseUserAuth!.uid,
                                    movieId: movie.id);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/Icons/bookmark.svg",
                                    colorFilter: ColorFilter.mode(
                                        Theme.of(context).colorScheme.primary,
                                        BlendMode.srcIn),
                                  ),
                                  const Icon(Icons.check_rounded,
                                      color: Colors.white, size: 15)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontSize: 15),
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                  ),
                  MovieSmallDetails(
                    movieId: movie.id ?? 0,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(fontSize: 14.sp),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
