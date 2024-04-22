import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/data/data_source_contract/remote/similer_datasource.dart';
import 'package:movies_app/domain/entities/SimilerEntitie.dart';
import 'package:movies_app/domain/repository_contract/remote/similer_repository.dart';

@Injectable(as: SimilerRepository)
class SimilerRepositoryImpl extends SimilerRepository {
  SimilerDataSource similerDataSource;
  @factoryMethod
  SimilerRepositoryImpl(this.similerDataSource);
  @override
  Future<Either<List<SimilerEntitie>, String>> getSimiler(
      {required num movieId}) async {
    var result = await similerDataSource.getSimiler(movieId: movieId);
  return  result.fold(
      (respose) {
        var similer =
            respose.results!.map((e) => e.toSimilerEntitie()).toList();
        return Left(similer);
      },
      (error) {
       return Right(error);
      },
    );
  }
}
