import 'package:flutter/material.dart';
import 'package:layered_arc/shopping/features/details/ui/details_route_builder.dart';
import 'package:layered_arc/shopping/features/home/ui/home_screen_route_builder.dart';
import 'package:layered_arc/shopping/models/movies_response.dart';
import 'package:layered_arc/shopping/navigation/navigation.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

class AppRoutesFactory extends RoutesFactory {
  final ServiceLocator _serviceLocator;
  AppRoutesFactory(this._serviceLocator);

  @override
  Route<dynamic> createHomePageRoute() {
    return MaterialPageRoute(builder: HomeScreenRouteBuilder(_serviceLocator));
  }

  @override
  Route createDetailsPageRoute(ProductResponse movie) {
    return MaterialPageRoute(builder: DetailsScreenRouteBuilder(_serviceLocator, movie));
  }

}
