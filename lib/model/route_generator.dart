import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/dashboard/dashboard_screen.dart';
import '../view/property/property_screen.dart';
import '../viewmodel/property_view_model.dart';
import 'page_not_found.dart';
import 'routes.dart' as routes;
import 'service_locator.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => DashboardScreen(),
        );
      case routes.DashboardScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: locator<PropertyViewModel>(),
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
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => PageNotFound(),
    );
  }
}
