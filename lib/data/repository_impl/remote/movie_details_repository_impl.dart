import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/movieDetails_datasource.dart';
import 'package:movies_app/domain/entities/MovieDetailsEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/movie_details_repository.dart';

@Injectable(as: MovieDetailsReposityory)
class MovieDetailsRepositoryImpl extends MovieDetailsReposityory {
  MovieDetailsDataSource movieDetailsDataSource;
  @factoryMethod
  MovieDetailsRepositoryImpl(this.movieDetailsDataSource);
  @override
  Future<Either<MovieDetailsEntitie, String>> getMovieDetails(
      {required num movieId}) async {
    var result = await movieDetailsDataSource.getMovieDetails(movieId: movieId);
    return result.fold((respose) {
      MovieDetailsEntitie details = respose.toMovieDetailsEntitie();
      return Left(details);
    }, (errror) {
      return Right(errror);
    });
  }
}
