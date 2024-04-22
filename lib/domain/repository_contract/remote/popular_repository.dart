import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/PopularEntitie.dart';

abstract class PopularRepository {
  Future<Either<List<PopularEntitie>, String>> getPopulerMovies();
}
