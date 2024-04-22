import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/filter_datasource.dart';
import 'package:movies_app/domain/entities/FilterEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/filter_repository.dart';

@Injectable(as: FilterRepository)
class FilterRepositoryImpl extends FilterRepository {
  FilterDataSource filterDataSource;
  @factoryMethod
  FilterRepositoryImpl(this.filterDataSource);
  @override
  Future<Either<List<FilterEntitie>, String>> filter(
      {required int categoryId}) async {
    var result = await filterDataSource.filter(categoryId: categoryId);
    return result.fold((filter) {
      List<FilterEntitie> filterEntiteList =
          filter.results!.map((e) => e.toFilterEntite()).toList();
      return Left(filterEntiteList);
    }, (error) {
      return Right(error);
    });
  }
}
