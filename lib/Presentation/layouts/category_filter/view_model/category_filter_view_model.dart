import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/entities/FilterEntitie.dart';
import 'package:movies_app/domain/use_cases/remote/filter_usecase.dart';

@injectable
class CategoryFilterViewModel extends Cubit<CategoryFilterStates> {
  CategoryFilterViewModel(this.filterUseCase)
      : super(CategoryFilterInitialState());
  @factoryMethod
  FilterUseCase filterUseCase;

  filter({required int categoryId}) async {
    emit(CategoryFilterLoadingState());
    var result = await filterUseCase.call(categoryId: categoryId);
    result.fold((filter) {
      emit(CategoryFilterSuccessState(filter));
    }, (error) {
      emit(CategoryFilterErrorState(error));
    });
  }
}

abstract class CategoryFilterStates {}

class CategoryFilterInitialState extends CategoryFilterStates {}

class CategoryFilterLoadingState extends CategoryFilterStates {}

class CategoryFilterSuccessState extends CategoryFilterStates {
  List<FilterEntitie> filter;
  CategoryFilterSuccessState(this.filter);
}

class CategoryFilterErrorState extends CategoryFilterStates {
  String error;
  CategoryFilterErrorState(this.error);
}
