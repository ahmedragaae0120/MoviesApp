import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/search_datasource.dart';
import 'package:movies_app/data/models/search_model/SearchResponse.dart';

@Injectable(as: SearchDataSource)
class SearchDataSourceImpl extends SearchDataSource {
  ApiManger apiManger;
  @factoryMethod
  SearchDataSourceImpl(this.apiManger);
  @override
  Future<Either<SearchResponse, String>> search({String ?movieName}) async {
    try {
      var response = await apiManger.getRequest(
          endPoints: EndPoints.searchEndPoint, queryParameters: {"query": movieName});
      SearchResponse search = SearchResponse.fromJson(response.data);
      return Left(search);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
