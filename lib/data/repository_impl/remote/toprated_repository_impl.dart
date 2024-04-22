import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/toprated_datasource.dart';
import 'package:movies_app/domain/entities/TopRatedEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/toprated_repository.dart';

@Injectable(as: TopRatedRepository)
class TopRatedRepositoryImpl extends TopRatedRepository {
  TopRatedDataSource topRatedDataSource;
  @factoryMethod
  TopRatedRepositoryImpl(this.topRatedDataSource);
  @override
  Future<Either<List<TopRatedEntitie>, String>> getTopRated() async {
    var result = await topRatedDataSource.getTopRated();
   return  result.fold((response) {
      List<TopRatedEntitie> topRated =
          response.results!.map((e) => e.toTopRatedEntitie()).toList();
      return Left(topRated);
    }, (error) {
      return Right(error);
    });
  }
}
