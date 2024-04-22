import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/TopRatedEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/toprated_repository.dart';
@injectable
class TopRatedUseCase {
  TopRatedRepository topRatedRepository;
  @factoryMethod
  TopRatedUseCase(this.topRatedRepository);
  Future<Either<List<TopRatedEntitie>, String>> call() {
    return  topRatedRepository.getTopRated();
  }
}
