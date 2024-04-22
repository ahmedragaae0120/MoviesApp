import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/filter_model/FilterResponse.dart';

abstract class FilterDataSource {
  Future<Either<FilterResponse, String>> filter({required int categoryId});
}
