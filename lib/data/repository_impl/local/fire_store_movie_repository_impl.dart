import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/local/fire_store_movie.dart';
import 'package:movies_app/data/models/firebase_movie_model.dart';
import 'package:movies_app/domain/repository_contract/local/fire_store_movie_repository.dart';

@Injectable(as: FireStoreMovieRepository)
class FireStoreMovieRepositoryImpl extends FireStoreMovieRepository {
  FireStoreMovieDataSource fireStoreMovieDataSource;
  @factoryMethod
  FireStoreMovieRepositoryImpl(this.fireStoreMovieDataSource);
  @override
  Future<Either<Stream<List<FireBaseMovieModel>>, String>> getMovie(
      {required String userId}) async {
    var result = await fireStoreMovieDataSource.getMovie(userId: userId);
    return result.fold(
      (response) {
        return Left(response);
      },
      (error) {
        return Right(error);
      },
    );
  }
}
