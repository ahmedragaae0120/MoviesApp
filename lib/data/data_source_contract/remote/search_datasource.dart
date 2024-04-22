import 'package:dartz/dartz.dart';
import 'package:movies_app/data/models/search_model/SearchResponse.dart';

abstract class SearchDataSource {
  Future<Either<SearchResponse, String>> search({required String movieName});
}
