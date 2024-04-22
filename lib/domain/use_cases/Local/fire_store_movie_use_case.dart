import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/models/firebase_movie_model.dart';
import 'package:movies_app/domain/repository_contract/local/fire_store_movie_repository.dart';

@injectable
class FireStoreMovieUseCase {
  FireStoreMovieRepository fireStoreMovieRepository;
  @factoryMethod
  FireStoreMovieUseCase(this.fireStoreMovieRepository);
  Future<Either<Stream<List<FireBaseMovieModel>>, String>>  call({required String userId}) =>
      fireStoreMovieRepository.getMovie(userId: userId);
}
