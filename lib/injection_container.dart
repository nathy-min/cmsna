import 'package:cmsna/core/network/network_manager.dart';
import 'package:cmsna/features/blog/data/datasources/blog_data_provider.dart';
import 'package:cmsna/features/blog/data/repositories/blog_repository.dart';
import 'package:cmsna/features/blog/domain/repositories/blog_repository.dart';
import 'package:cmsna/features/blog/domain/usecases/get_blog_usecase.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';
import 'package:cmsna/features/home/domain/repositories/menu_repository.dart';
import 'package:cmsna/features/home/domain/usecases/get_menu_items.dart';

import 'package:get_it/get_it.dart';

import 'features/home/data/dataprovider/menu_data_provider.dart';
import 'features/home/data/repositories/menu_repository_impl.dart';
import 'features/home/presentation/bloc/menu_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => NetworkManager());

  //!Menu -----------------------
  //bloc
  serviceLocator
      .registerFactory(() => MenuBloc(getMenuUsecase: serviceLocator()));
  //Usecase
  serviceLocator.registerLazySingleton(
      () => GetMenuUsecase(repository: serviceLocator()));
  //Repository
  serviceLocator.registerLazySingleton<MenuRepository>(
      () => MenuRepositoryImpl(dataProvider: serviceLocator()));
  //DataProvider
  serviceLocator
      .registerLazySingleton<MenuDataProvider>(() => MenuDataProviderImpl());

  //!Blog -----------------------
  //bloc
  serviceLocator
      .registerFactory(() => BlogBloc(getBlogUsecase: serviceLocator()));
  //Usecase
  serviceLocator.registerLazySingleton(
      () => GetBlogUsecase(repository: serviceLocator()));
  //Repository
  serviceLocator.registerLazySingleton<BlogRepository>(
      () => BlogRepositoryImpl(dataProvider: serviceLocator()));
  //DataProvider
  serviceLocator.registerLazySingleton<BlogDataProvider>(
      () => BlogDataProviderImpl(networkManager: serviceLocator()));
}
