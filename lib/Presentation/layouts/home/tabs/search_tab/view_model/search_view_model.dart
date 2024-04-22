import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/SearchEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/search_usecase.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabStates> {
  SearchTabViewModel(this.searchUseCase) : super(SearchTabInitialState());
  @factoryMethod
  SearchUseCase searchUseCase;
  static SearchTabViewModel getObject(BuildContext context) =>
      BlocProvider.of(context);
  search({required String movieName}) async {
    emit(SearchTabLoadingState());
    if (movieName == "") {
      emit(SearchTabErrorState("no data"));
    }
    var result = await searchUseCase.call(movieName: movieName);
    result.fold(
      (response) {
        emit(SearchTabSuccessState(response));
      },
      (error) {
        emit(SearchTabErrorState(error));
      },
    );
  }
}

abstract class SearchTabStates {}

class SearchTabInitialState extends SearchTabStates {}

class SearchTabLoadingState extends SearchTabStates {}

class SearchTabSuccessState extends SearchTabStates {
  List<SearchEntitie> searchResult;
  SearchTabSuccessState(this.searchResult);
}

class SearchTabErrorState extends SearchTabStates {
  String error;
  SearchTabErrorState(this.error);
}
