
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/api/api_endpoints.dart';
import 'package:movies_app/core/api/api_manger.dart';
import 'package:movies_app/data/models/categories/CategoryResponse.dart';
import '../../data_source_contract/remote/categories_datasource.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl extends CategoriesDataSource{
  ApiManger apiManger;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManger);
  @override
  Future<Either<CategoryResponse, String>> getCategories() async {
    try{
      var response = await apiManger.getRequest(endPoints: EndPoints.categoryEndPoint);
      CategoryResponse categoryResponse = CategoryResponse.fromJson(response.data);
      return Left(categoryResponse);
    }catch(e){
      return Right(e.toString());
    }
  }

}