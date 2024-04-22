import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/categories/Genres.dart';

abstract class CategoriesRepository{
  Future<Either<List<Genres>, String>> getCategories();
}