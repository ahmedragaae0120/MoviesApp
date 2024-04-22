import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/TopRatedEntitie.dart';

abstract class TopRatedRepository {
  Future<Either<List<TopRatedEntitie>, String>> getTopRated();
}
