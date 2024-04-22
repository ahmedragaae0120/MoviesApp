import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/PopularEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/popular_repository.dart';

@injectable
class PoplularUseCase {
  PopularRepository popularMovie;
  @factoryMethod
  PoplularUseCase(this.popularMovie);
  Future<Either<List<PopularEntitie>, String>> call() {
    return popularMovie.getPopulerMovies();
  }
}
