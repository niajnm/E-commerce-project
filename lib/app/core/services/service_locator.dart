import 'package:e_commerce/app/data/local/preference/preference_manager.dart';
import 'package:e_commerce/app/data/local/preference/preference_manager_impl.dart';
import 'package:e_commerce/app/data/remote/remote_auth/auth_remote_source.dart';
import 'package:e_commerce/app/data/remote/remote_auth/auth_remote_source_impl.dart';

import 'package:e_commerce/app/data/repository/auth_repository/auth_repository.dart';
import 'package:e_commerce/app/data/repository/auth_repository/auth_repository_impl.dart';
import 'package:e_commerce/app/data/repository/product_repository/product_repository.dart';
import 'package:e_commerce/app/data/repository/product_repository/product_repository_impl.dart';

import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static Future<void> setUpServiceLocator() async {
    serviceLocator.registerLazySingleton<PreferenceManager>(
        () => PreferenceManagerImpl());

// initialization
    serviceLocator
        .registerLazySingleton<AuthRemoteSource>(() => AuthRemoteSourceImpl());
    serviceLocator.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(serviceLocator()));

    serviceLocator.registerLazySingleton<ProductListRepository>(
        () => ProductListRepositoryImpl(serviceLocator()));
  }
}
