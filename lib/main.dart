import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:provider/provider.dart';

import 'routing/service_locator.dart';
import 'view/home_screen.dart';
import 'viewmodel/property_view_model.dart';

Future<void> main() async {
  await DotEnv.load(fileName: ".env");
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RESERVE COM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<PropertyViewModel>(
        create: (ctx) => PropertyViewModel(),
        child: HomeScreen(),
      ),
    );
  }
}
