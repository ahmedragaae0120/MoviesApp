import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/search_datasource.dart';
import 'package:movies_app/data/models/search_model/search_results.dart';
import 'package:movies_app/domain/entities/SearchEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  SearchDataSource searchDataSource;
  @factoryMethod
  SearchRepositoryImpl(this.searchDataSource);
  @override
  Future<Either<List<SearchEntitie>, String>> search(
      {required String movieName}) async {
    var result = await searchDataSource.search(movieName: movieName);
    return result.fold((response) {
      List<SearchResults> resultList = response.results ?? [];
      List<SearchEntitie> searchEntitieResult =
          resultList.map((e) => e.toSearchEntitie()).toList();
      return Left(searchEntitieResult);
    }, (error) => Right(error));
  }
}
