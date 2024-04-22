import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repository_contract/remote/categories_repository.dart';

import '../../../data/models/categories/Genres.dart';
@injectable
class CategoryUseCase{
  CategoriesRepository categoriesRepository;
  @factoryMethod
  CategoryUseCase(this.categoriesRepository);
  Future<Either<List<Genres>, String>> call()=> categoriesRepository.getCategories();
}