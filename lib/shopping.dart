import 'package:flutter/material.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

import 'app_routes_factory.dart';
import 'shopping/navigation/navigation.dart';
import 'app_theme.dart';

class ShoppingApp extends StatelessWidget {
  final String initialRoute;
  final ServiceLocator serviceLocator;
  const ShoppingApp(
      {Key? key, required this.initialRoute, required this.serviceLocator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return AppTheme(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateAppRoute(AppRoutesFactory(serviceLocator)),
    ));

  }
}