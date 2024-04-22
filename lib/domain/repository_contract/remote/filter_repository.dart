import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/entities/FilterEntitie.dart';

abstract class FilterRepository {
  Future<Either<List<FilterEntitie>, String>> filter({required int categoryId});
}
