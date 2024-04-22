import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/UpcomingEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/upcoming_repository.dart';

@injectable
class UpcomingUseCase {
  UpcomingRepository upcomingRepository;
  @factoryMethod
  UpcomingUseCase(this.upcomingRepository);
  Future<Either<List<UpcomingEntitie>, String>> call() {
   return upcomingRepository.getUpcomingMovies();
  }
}
