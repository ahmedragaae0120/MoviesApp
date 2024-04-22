import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/data_source_contract/remote/upcoming_datasource.dart';
import 'package:movies_app/data/models/upcoming_model/UpcomingResponse.dart';

@Injectable(as: UpcomingDataSorce)
class UpcomingDataSourceImpl extends UpcomingDataSorce {
  ApiManger apiManger;
  @factoryMethod
  UpcomingDataSourceImpl(this.apiManger);
  @override
  Future<Either<UpcomingResponse, String>> getUpcomingMovies() async {
    try {
      var response =
          await apiManger.getRequest(endPoints: EndPoints.upcomingEndPoint);
      UpcomingResponse upcomingResponse =
          UpcomingResponse.fromJson(response.data);
      return Left(upcomingResponse);
    } catch (e) {
      return Right(e.toString());
    }
  }
}
