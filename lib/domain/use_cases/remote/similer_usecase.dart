import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/SimilerEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/similer_repository.dart';
@injectable
class SimilerUseCase {
  SimilerRepository similerRepository;
  @factoryMethod
   SimilerUseCase(this.similerRepository);
  Future<Either<List<SimilerEntitie>, String>> call({required num movieId}) {
   return similerRepository.getSimiler(movieId: movieId);
  }
}
