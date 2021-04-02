import 'package:get_it/get_it.dart';

import '../model/api_manager.dart';
import 'navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // * Api Manager
  locator.registerLazySingleton<ApiManager>(() => ApiManager());

  // * Navigation Service
  locator.registerLazySingleton<NavigationService>(() => NavigationService());

  // * Property
  // locator.registerLazySingleton<PropertyViewModel>(() => PropertyViewModel());
}
