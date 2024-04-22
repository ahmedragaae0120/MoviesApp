import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/movie_details_model/MovieDetailsModel.dart';

abstract class MovieDetailsDataSource {
  Future<Either<MovieDetailsModel, String>> getMovieDetails({required num movieId});
}
