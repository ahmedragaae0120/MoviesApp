import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/firebase_movie_model.dart';

abstract class FireStoreMovieDataSource {
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovie(
      {required String userId});
}
