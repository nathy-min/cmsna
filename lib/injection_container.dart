import 'package:cmsna/core/network/network_manager.dart';
import 'package:cmsna/features/blog/data/datasources/blog_data_provider.dart';
import 'package:cmsna/features/blog/data/repositories/blog_repository.dart';
import 'package:cmsna/features/blog/domain/repositories/blog_repository.dart';
import 'package:cmsna/features/blog/domain/usecases/get_blog_usecase.dart';
import 'package:cmsna/features/blog/presentation/bloc/blog_bloc/blog_bloc.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => NetworkManager());
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
