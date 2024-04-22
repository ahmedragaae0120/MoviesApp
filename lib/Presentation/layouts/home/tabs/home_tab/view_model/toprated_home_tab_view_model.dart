import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/TopRatedEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/toprated_usecase.dart';

@injectable
class TopRatedHomeTabViewModel extends Cubit<TopRatedHomeTabStates> {
  TopRatedHomeTabViewModel(this.topRatedUseCase)
      : super(TopRatedHomeTabInitialState());
  @factoryMethod
  TopRatedUseCase topRatedUseCase;

  getTopRated() async {
    emit(TopRatedHomeTabLoadingState());
    var result = await topRatedUseCase.call();
    result.fold((topRated) {
      emit(TopRatedHomeTabSuccessState(topRated));
    }, (error) {
      emit(TopRatedHomeTabErrorState(error));
    });
  }
}

abstract class TopRatedHomeTabStates {}

class TopRatedHomeTabInitialState extends TopRatedHomeTabStates {}

class TopRatedHomeTabLoadingState extends TopRatedHomeTabStates {}

class TopRatedHomeTabSuccessState extends TopRatedHomeTabStates {
  List<TopRatedEntitie> topRated;
  TopRatedHomeTabSuccessState(this.topRated);
}

class TopRatedHomeTabErrorState extends TopRatedHomeTabStates {
  String error;
  TopRatedHomeTabErrorState(this.error);
}
