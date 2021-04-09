import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservecom/view/home_screen.dart';
import 'package:reservecom/view/search/search_screen.dart';

import '../view/dashboard/dashboard_screen.dart';
import '../view/property/property_screen.dart';
import '../view/view_common/page_not_found.dart';
import '../viewmodel/property_view_model.dart';
import 'routes.dart' as routes;
import 'service_locator.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomeScreen(),
        );

      // case routes.DashboardScreenRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => ChangeNotifierProvider.value(
      //       value: locator<PropertyViewModel>(),
      //       child: DashboardScreen(),
      //     ),
      //   );
      case routes.DashboardScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (ctx) => PropertyViewModel(),
            child: DashboardScreen(),
          ),
      );

      case routes.PropertyScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: locator<PropertyViewModel>(),
            child: PropertyScreen(),
          ),
        );

      case routes.SearchScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: locator<PropertyViewModel>(),
            child: SearchScreen(),
          ),
        );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => PageNotFound(),
    );
  }
}
