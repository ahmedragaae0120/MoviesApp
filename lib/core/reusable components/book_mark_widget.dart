import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/Presentation/layouts/provider/auth_provider.dart';
import 'package:movies_app/core/firebase/firestore_helper.dart';
import 'package:movies_app/data/models/firebase_movie_model.dart';

// ignore: must_be_immutable
class BookMarkWidget extends StatelessWidget {
  BookMarkWidget({
    super.key,
    required this.authProvider,
    required this.movie,
  });

  final AuthProvider authProvider;
  var movie;
  late bool isChosen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        enableFeedback: false,
        onTap: () {
          isChosen
              ? FireStoreHelper.deleteMovie(
                  userId: authProvider.fireBaseUserAuth!.uid, movieId: movie.id)
              : FireStoreHelper.addMovie(
                  userid: authProvider.fireBaseUserAuth?.uid ?? "",
                  movie: FireBaseMovieModel(
                      backdropPath: movie.backdropPath,
                      id: movie.id,
                      isSelected: true,
                      releaseDate: movie.releaseDate,
                      title: movie.title),
                );
        },
        child: StreamBuilder(
          stream: FireStoreHelper.getIsCheck(
              userID: authProvider.fireBaseUserAuth!.uid, id: movie.id),
          builder: (context, snapshot) {
            FireBaseMovieModel movie =
                snapshot.data ?? FireBaseMovieModel(isSelected: false);
            bool isSelected = movie.isSelected!;
            isChosen = movie.isSelected!;
            return Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/Icons/bookmark.svg",
                  colorFilter: ColorFilter.mode(
                      isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                      BlendMode.srcIn),
                ),
                Icon(isSelected ? Icons.check_rounded : Icons.add,
                    color: Colors.white, size: 15)
              ],
            );
          },
        ));
  }
}
