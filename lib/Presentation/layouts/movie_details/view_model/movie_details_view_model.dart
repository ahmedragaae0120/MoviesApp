import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/MovieDetailsEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/movie_details_usecase.dart';

@injectable
class MovieDetailsHomeTabViewModel extends Cubit<MovieDetailsHomeTabStates> {
  MovieDetailsHomeTabViewModel(this.movieDetailsUseCase)
      : super(MovieDetailsHomeTabInitialState());
  @factoryMethod
  MovieDetailsUseCase movieDetailsUseCase;

  getMovieDetails({required num movieId}) async {
    emit(MovieDetailsHomeTabLoadingState());
    var result = await movieDetailsUseCase.call(movieId: movieId);
    result.fold(
      (details) {
        emit(MovieDetailsHomeTabSuccessState(details));
      },
      (error) {
        emit(MovieDetailsHomeTabErrorState(error));
      },
    );
  }
}

abstract class MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabInitialState extends MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabLoadingState extends MovieDetailsHomeTabStates {}

class MovieDetailsHomeTabSuccessState extends MovieDetailsHomeTabStates {
  MovieDetailsEntitie details;
  MovieDetailsHomeTabSuccessState(this.details);
}

class MovieDetailsHomeTabErrorState extends MovieDetailsHomeTabStates {
  String error;
  MovieDetailsHomeTabErrorState(this.error);
}
