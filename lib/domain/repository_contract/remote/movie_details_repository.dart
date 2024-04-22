import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/MovieDetailsEntitie.dart';

abstract class MovieDetailsReposityory {
  Future<Either<MovieDetailsEntitie, String>> getMovieDetails({required num movieId});
}
