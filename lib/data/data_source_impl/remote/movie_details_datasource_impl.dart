import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/movieDetails_datasource.dart';
import 'package:movies_app/data/models/movie_details_model/MovieDetailsModel.dart';

@Injectable(as: MovieDetailsDataSource)
class MovieDetailsDataSourceImpl extends MovieDetailsDataSource {
  ApiManger apiManger;
  @factoryMethod
  MovieDetailsDataSourceImpl(this.apiManger);
  @override
  Future<Either<MovieDetailsModel, String>> getMovieDetails(
      {required num movieId}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.movieDetailsEndPoint(movieId: movieId));
      MovieDetailsModel details = MovieDetailsModel.fromJson(response.data);
      return Left(details);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
