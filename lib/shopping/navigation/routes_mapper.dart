part of 'navigation.dart';

Route<dynamic>? Function(RouteSettings settings) onGenerateAppRoute(
    RoutesFactory routesFactory) {
  return (RouteSettings settings) {
    switch (settings.name) {
      case _homePageRouteName:
        return routesFactory.createHomePageRoute();

      case _detailsRouteName:
        final args = settings.arguments as ProductDetails;
        return routesFactory.createDetailsPageRoute(args.movie);

      default:
        return routesFactory.createHomePageRoute();
    }
  };
}
