import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:provider/provider.dart';

import 'routing/service_locator.dart';
import 'view/home_screen.dart';
import 'viewmodel/multi_theme_view_model.dart';
import 'viewmodel/property_view_model.dart';
import 'viewmodel/search_view_model.dart';


Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: ".env");
  await setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MultiThemeViewModel>(
          create: (_) => MultiThemeViewModel(),
        ),
        ChangeNotifierProvider<PropertyViewModel>(
          create: (_) => PropertyViewModel(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (_) => SearchViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final _multiThemeViewModel = Provider.of<MultiThemeViewModel>(context);  // Theme変更時にlisten必要

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RESERVE COM',
      theme: _multiThemeViewModel.selectedTheme,
      home:  HomeScreen(),
    );
  }
}
