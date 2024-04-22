import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/categories/CategoryResponse.dart';

abstract class CategoriesDataSource{
  Future<Either<CategoryResponse, String>> getCategories();
}