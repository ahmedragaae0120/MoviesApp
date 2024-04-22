// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/data_source_contract/local/fire_store_movie.dart' as _i41;
import '../../data/data_source_contract/local/login_data_source.dart' as _i16;
import '../../data/data_source_contract/local/register_data_source.dart'
    as _i10;
import '../../data/data_source_contract/remote/categories_datasource.dart'
    as _i19;
import '../../data/data_source_contract/remote/filter_datasource.dart' as _i8;
import '../../data/data_source_contract/remote/movieDetails_datasource.dart'
    as _i14;
import '../../data/data_source_contract/remote/popular_datasource.dart' as _i35;
import '../../data/data_source_contract/remote/search_datasource.dart' as _i25;
import '../../data/data_source_contract/remote/similer_datasource.dart' as _i23;
import '../../data/data_source_contract/remote/toprated_datasource.dart' as _i6;
import '../../data/data_source_contract/remote/upcoming_datasource.dart'
    as _i21;
import '../../data/data_source_impl/local/fire_store_movie_impl.dart' as _i42;
import '../../data/data_source_impl/local/login_data_source_impl.dart' as _i17;
import '../../data/data_source_impl/local/register_data_source_impl.dart'
    as _i11;
import '../../data/data_source_impl/remote/categories_datasource_impl.dart'
    as _i20;
import '../../data/data_source_impl/remote/filter_datasource_impl.dart' as _i9;
import '../../data/data_source_impl/remote/movie_details_datasource_impl.dart'
    as _i15;
import '../../data/data_source_impl/remote/popular_datasource_impl.dart'
    as _i36;
import '../../data/data_source_impl/remote/search_datasource_impl.dart' as _i26;
import '../../data/data_source_impl/remote/similer_datasource_impl.dart'
    as _i24;
import '../../data/data_source_impl/remote/toprated_datasource_impl.dart'
    as _i7;
import '../../data/data_source_impl/remote/upcoming_datasource_impl.dart'
    as _i22;
import '../../data/repository_impl/local/fire_store_movie_repository_impl.dart'
    as _i56;
import '../../data/repository_impl/local/login_repository_impl.dart' as _i30;
import '../../data/repository_impl/local/register_repository_impl.dart' as _i13;
import '../../data/repository_impl/remote/categories_repository_impl.dart'
    as _i48;
import '../../data/repository_impl/remote/filter_repository_impl.dart' as _i45;
import '../../data/repository_impl/remote/movie_details_repository_impl.dart'
    as _i28;
import '../../data/repository_impl/remote/popular_repository_impl.dart' as _i61;
import '../../data/repository_impl/remote/search_repository_impl.dart' as _i38;
import '../../data/repository_impl/remote/similer_repository_impl.dart' as _i32;
import '../../data/repository_impl/remote/toprated_repository_impl.dart'
    as _i34;
import '../../data/repository_impl/remote/upcoming_repository_impl.dart'
    as _i51;
import '../../domain/repository_contract/local/fire_store_movie_repository.dart'
    as _i55;
import '../../domain/repository_contract/local/login_repository.dart' as _i29;
import '../../domain/repository_contract/local/register_repository.dart'
    as _i12;
import '../../domain/repository_contract/remote/categories_repository.dart'
    as _i47;
import '../../domain/repository_contract/remote/filter_repository.dart' as _i44;
import '../../domain/repository_contract/remote/movie_details_repository.dart'
    as _i27;
import '../../domain/repository_contract/remote/popular_repository.dart'
    as _i60;
import '../../domain/repository_contract/remote/search_repository.dart' as _i37;
import '../../domain/repository_contract/remote/similer_repository.dart'
    as _i31;
import '../../domain/repository_contract/remote/toprated_repository.dart'
    as _i33;
import '../../domain/repository_contract/remote/upcoming_repository.dart'
    as _i50;
import '../../domain/use_cases/Local/fire_store_movie_use_case.dart' as _i62;
import '../../domain/use_cases/Local/login_usecase.dart' as _i46;
import '../../domain/use_cases/Local/register_usecase.dart' as _i18;
import '../../domain/use_cases/remote/category_usecase.dart' as _i59;
import '../../domain/use_cases/remote/filter_usecase.dart' as _i54;
import '../../domain/use_cases/remote/movie_details_usecase.dart' as _i53;
import '../../domain/use_cases/remote/popular_usecase.dart' as _i68;
import '../../domain/use_cases/remote/search_usecase.dart' as _i58;
import '../../domain/use_cases/remote/similer_usecase.dart' as _i39;
import '../../domain/use_cases/remote/toprated_usecase.dart' as _i40;
import '../../domain/use_cases/remote/upcoming_usecase.dart' as _i67;
import '../../Presentation/layouts/category_filter/view_model/category_filter_view_model.dart'
    as _i69;
import '../../Presentation/layouts/home/tabs/browse_tab/view_model/browse_view_model.dart'
    as _i66;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/popular_home_tab_view_model.dart'
    as _i71;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/toprated_home_tab_view_model.dart'
    as _i57;
import '../../Presentation/layouts/home/tabs/home_tab/view_model/upcoming_home_tab_view_model.dart'
    as _i70;
import '../../Presentation/layouts/home/tabs/search_tab/view_model/search_view_model.dart'
    as _i63;
import '../../Presentation/layouts/home/tabs/watch%20list_tab/view_model/watch_list_view_model.dart'
    as _i65;
import '../../Presentation/layouts/login/login_Viewmodel/login_view_model.dart'
    as _i52;
import '../../Presentation/layouts/movie_details/view_model/movie_details_view_model.dart'
    as _i64;
import '../../Presentation/layouts/movie_details/view_model/similer_view_model.dart'
    as _i43;
import '../../Presentation/layouts/register/register_viewmodel/register_view_model.dart'
    as _i49;
import '../api/api_manger.dart' as _i3;
import '../firebase/auth_helper.dart' as _i4;
import '../firebase/firestore_helper.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.singleton<_i4.AuthHelper>(() => _i4.AuthHelper());
    gh.singleton<_i5.FireStoreHelper>(() => _i5.FireStoreHelper());
    gh.factory<_i6.TopRatedDataSource>(
        () => _i7.TopRatedDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i8.FilterDataSource>(
        () => _i9.FilterDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i10.RegisterDataSource>(
        () => _i11.registerDataSourceImpl(gh<_i4.AuthHelper>()));
    gh.factory<_i12.RegisterRepository>(() => _i13.registerRepositoryImpl(
        registerDataSource: gh<_i10.RegisterDataSource>()));
    gh.factory<_i14.MovieDetailsDataSource>(
        () => _i15.MovieDetailsDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i16.LoginDataSource>(
        () => _i17.LoginDataSourceImpl(gh<_i4.AuthHelper>()));
    gh.factory<_i18.RegisterUsecase>(
        () => _i18.RegisterUsecase(gh<_i12.RegisterRepository>()));
    gh.factory<_i19.CategoriesDataSource>(
        () => _i20.CategoriesDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i21.UpcomingDataSorce>(
        () => _i22.UpcomingDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i23.SimilerDataSource>(
        () => _i24.SimilerDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i25.SearchDataSource>(
        () => _i26.SearchDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i27.MovieDetailsReposityory>(() =>
        _i28.MovieDetailsRepositoryImpl(gh<_i14.MovieDetailsDataSource>()));
    gh.factory<_i29.LoginRepository>(
        () => _i30.LoginRepositoryImpl(gh<_i16.LoginDataSource>()));
    gh.factory<_i31.SimilerRepository>(
        () => _i32.SimilerRepositoryImpl(gh<_i23.SimilerDataSource>()));
    gh.factory<_i33.TopRatedRepository>(
        () => _i34.TopRatedRepositoryImpl(gh<_i6.TopRatedDataSource>()));
    gh.factory<_i35.PopularDataSource>(
        () => _i36.PopularDataSourceImpl(apiManger: gh<_i3.ApiManger>()));
    gh.factory<_i37.SearchRepository>(
        () => _i38.SearchRepositoryImpl(gh<_i25.SearchDataSource>()));
    gh.factory<_i39.SimilerUseCase>(
        () => _i39.SimilerUseCase(gh<_i31.SimilerRepository>()));
    gh.factory<_i40.TopRatedUseCase>(
        () => _i40.TopRatedUseCase(gh<_i33.TopRatedRepository>()));
    gh.factory<_i41.FireStoreMovieDataSource>(
        () => _i42.FireStoreMovieDateSourceImpl(gh<_i5.FireStoreHelper>()));
    gh.factory<_i43.SimilerHomeTabViewModel>(
        () => _i43.SimilerHomeTabViewModel(gh<_i39.SimilerUseCase>()));
    gh.factory<_i44.FilterRepository>(
        () => _i45.FilterRepositoryImpl(gh<_i8.FilterDataSource>()));
    gh.factory<_i46.LoginUsecase>(
        () => _i46.LoginUsecase(gh<_i29.LoginRepository>()));
    gh.factory<_i47.CategoriesRepository>(
        () => _i48.CategoriesRepositoryImpl(gh<_i19.CategoriesDataSource>()));
    gh.factory<_i49.RegisterViewModel>(
        () => _i49.RegisterViewModel(gh<_i18.RegisterUsecase>()));
    gh.factory<_i50.UpcomingRepository>(
        () => _i51.UpcomingRepositoryImpl(gh<_i21.UpcomingDataSorce>()));
    gh.factory<_i52.loginViewModel>(
        () => _i52.loginViewModel(gh<_i46.LoginUsecase>()));
    gh.factory<_i53.MovieDetailsUseCase>(
        () => _i53.MovieDetailsUseCase(gh<_i27.MovieDetailsReposityory>()));
    gh.factory<_i54.FilterUseCase>(
        () => _i54.FilterUseCase(gh<_i44.FilterRepository>()));
    gh.factory<_i55.FireStoreMovieRepository>(() =>
        _i56.FireStoreMovieRepositoryImpl(gh<_i41.FireStoreMovieDataSource>()));
    gh.factory<_i57.TopRatedHomeTabViewModel>(
        () => _i57.TopRatedHomeTabViewModel(gh<_i40.TopRatedUseCase>()));
    gh.factory<_i58.SearchUseCase>(
        () => _i58.SearchUseCase(gh<_i37.SearchRepository>()));
    gh.factory<_i59.CategoryUseCase>(
        () => _i59.CategoryUseCase(gh<_i47.CategoriesRepository>()));
    gh.factory<_i60.PopularRepository>(
        () => _i61.PopularRepositoryImpl(gh<_i35.PopularDataSource>()));
    gh.factory<_i62.FireStoreMovieUseCase>(
        () => _i62.FireStoreMovieUseCase(gh<_i55.FireStoreMovieRepository>()));
    gh.factory<_i63.SearchTabViewModel>(
        () => _i63.SearchTabViewModel(gh<_i58.SearchUseCase>()));
    gh.factory<_i64.MovieDetailsHomeTabViewModel>(() =>
        _i64.MovieDetailsHomeTabViewModel(gh<_i53.MovieDetailsUseCase>()));
    gh.factory<_i65.WatchListTabViewModel>(
        () => _i65.WatchListTabViewModel(gh<_i62.FireStoreMovieUseCase>()));
    gh.factory<_i66.BrowseTabViewModel>(
        () => _i66.BrowseTabViewModel(gh<_i59.CategoryUseCase>()));
    gh.factory<_i67.UpcomingUseCase>(
        () => _i67.UpcomingUseCase(gh<_i50.UpcomingRepository>()));
    gh.factory<_i68.PoplularUseCase>(
        () => _i68.PoplularUseCase(gh<_i60.PopularRepository>()));
    gh.factory<_i69.CategoryFilterViewModel>(
        () => _i69.CategoryFilterViewModel(gh<_i54.FilterUseCase>()));
    gh.factory<_i70.UpcomingHomeTabViewModel>(
        () => _i70.UpcomingHomeTabViewModel(gh<_i67.UpcomingUseCase>()));
    gh.factory<_i71.PopularHomeTabViewModel>(
        () => _i71.PopularHomeTabViewModel(gh<_i68.PoplularUseCase>()));
    return this;
  }
}
