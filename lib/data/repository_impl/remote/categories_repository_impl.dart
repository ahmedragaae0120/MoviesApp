import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/categories_datasource.dart';
import 'package:movies_app/data/models/categories/CategoryResponse.dart';
import 'package:movies_app/data/models/categories/Genres.dart';
import '../../../domain/repository_contract/remote/categories_repository.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository{
  CategoriesDataSource categoriesDataSource;
  @factoryMethod
  CategoriesRepositoryImpl(this.categoriesDataSource);
  @override
  Future<Either<List<Genres>, String>> getCategories() async {
    var result = await categoriesDataSource.getCategories();
    return result.fold((response) {
      CategoryResponse categoryResponse = response;
      return Left(categoryResponse.genres??[]);
      },
            (errror) {
      return Right(errror);
    });
  }

}