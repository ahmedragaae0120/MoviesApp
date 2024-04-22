import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/similer_datasource.dart';
import 'package:movies_app/data/models/similer_model/similar_response.dart';
@Injectable(as: SimilerDataSource)
class SimilerDataSourceImpl extends SimilerDataSource {
  ApiManger apiManger;
  @factoryMethod
  SimilerDataSourceImpl(this.apiManger);
  @override
  Future<Either<SimilarResponse, String>> getSimiler({required movieId}) async {
    try {
      var response =
          await apiManger.getRequest(endPoints: "/3/movie/$movieId/similar");
      SimilarResponse similarResponse = SimilarResponse.fromJson(response.data);
      return Left(similarResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
