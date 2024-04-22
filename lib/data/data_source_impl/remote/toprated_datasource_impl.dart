import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/toprated_datasource.dart';
import 'package:movies_app/data/models/toprated_model/TopRatedResponse.dart';

@Injectable(as: TopRatedDataSource)
class TopRatedDataSourceImpl extends TopRatedDataSource {
  ApiManger apiManger;
  @factoryMethod
  TopRatedDataSourceImpl(this.apiManger);
  @override
  Future<Either<TopRatedResponse, String>> getTopRated() async {
    try {
      var response =
          await apiManger.getRequest(endPoints: EndPoints.topRatedEndPoint);
      TopRatedResponse topRatedResponse =
          TopRatedResponse.fromJson(response.data);
      return Left(topRatedResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
