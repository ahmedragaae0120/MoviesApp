import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/SimilerEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/similer_usecase.dart';

@injectable
class SimilerHomeTabViewModel extends Cubit<SimilerHomeTabStates> {
  SimilerHomeTabViewModel(this.similerUseCase)
      : super(SimilerHomeTabInitialState());
  @factoryMethod
  SimilerUseCase similerUseCase;

  getSimiler({required num movieId}) async {
    emit(SimilerHomeTabLoadingState());
    var result = await similerUseCase.call(movieId: movieId);
    result.fold(
      (similer) {
      emit(SimilerHomeTabSuccessState(similer));
    }, (error) {
      emit(SimilerHomeTabErrorState(error));
    }
    );
  }
}

abstract class SimilerHomeTabStates {}

class SimilerHomeTabInitialState extends SimilerHomeTabStates {}

class SimilerHomeTabLoadingState extends SimilerHomeTabStates {}

class SimilerHomeTabSuccessState extends SimilerHomeTabStates {
  List<SimilerEntitie> similer;
  SimilerHomeTabSuccessState(this.similer);
}

class SimilerHomeTabErrorState extends SimilerHomeTabStates {
  String error;
  SimilerHomeTabErrorState(this.error);
}
