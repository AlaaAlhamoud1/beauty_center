import 'package:beauty_center/application/authentication/repository/auth_repository.dart';
import 'package:beauty_center/application/offers/repository/offer_repository.dart';
import 'package:beauty_center/core/data/new_remote/network_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app_store/app_store.dart';
import 'core/data/local_data/local_data_source.dart';

final getIt = GetIt.instance;

Future<void> configureInjection() async {
  /// data sources
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final AppStore appStore = AppStore();

  ///core
  getIt.registerLazySingleton<NetworkService>(() => DioNetworkService());

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceSharedPreferences(getIt()));
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<OfferRepository>(
      () => OfferRepositoryImpl(getIt()));

  getIt.registerLazySingleton<AppStore>(() => appStore);
}
