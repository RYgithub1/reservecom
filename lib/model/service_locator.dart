import 'package:get_it/get_it.dart';
import 'package:reservecom/viewmodel/property_view_model.dart';

import 'api_manager.dart';
import 'navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // * Api Manager
  locator.registerLazySingleton<ApiManager>(() => ApiManager());

  // * Navigation Service
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  // * Local Data Source
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // locator.registerLazySingleton<LocalDataSource>(
  //     () => SharedPreferenceDataSource(prefs: sharedPreferences));

  // * Dashboard Provider
  // locator.registerLazySingleton<DashboardProvider>(() => DashboardProvider());

  // * Firebase Analytics Manager
  // locator.registerLazySingleton<FirebaseAnalyticsService>(
  //     () => FirebaseAnalyticsService());

  // * Property
  locator.registerLazySingleton<PropertyViewModel>(() => PropertyViewModel());
}
