import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/UpcomingEntitie.dart';

abstract class UpcomingRepository {
  Future<Either<List<UpcomingEntitie>, String>> getUpcomingMovies();
}
