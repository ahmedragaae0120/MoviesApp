import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/UpcomingEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/upcoming_usecase.dart';

@injectable
class UpcomingHomeTabViewModel extends Cubit<UpcomingHomeTabStates> {
  UpcomingHomeTabViewModel(this.upcomingUseCase)
      : super(UpcomingHomeTabInitialState());
  @factoryMethod
  UpcomingUseCase upcomingUseCase;

  getUpcoming() async {
    emit(UpcomingHomeTabLoadingState());
    var result = await upcomingUseCase.call();
    result.fold((response) {
      emit(UpcomingHomeTabSuccessState(response));
    }, (error) {
      emit(UpcomingHomeTabErrorState(error));
    });
  }
}

abstract class UpcomingHomeTabStates {}

class UpcomingHomeTabInitialState extends UpcomingHomeTabStates {}

class UpcomingHomeTabLoadingState extends UpcomingHomeTabStates {}

class UpcomingHomeTabSuccessState extends UpcomingHomeTabStates {
  List<UpcomingEntitie> upcoming;
  UpcomingHomeTabSuccessState(this.upcoming);
}

class UpcomingHomeTabErrorState extends UpcomingHomeTabStates {
  String error;
  UpcomingHomeTabErrorState(this.error);
}
