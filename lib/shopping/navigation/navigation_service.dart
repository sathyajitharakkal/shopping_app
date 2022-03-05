part of 'navigation.dart';

class NavigationService {
  Future<void> openHome(BuildContext context) {
    return Navigator.of(context).popAndPushNamed(_homePageRouteName);
  }

  Future<void> openDetails(BuildContext context, ProductResponse details) {
    print("details 1");
    return Navigator.of(context).pushNamed(_detailsRouteName, arguments: ProductDetails(details));
  }

  void back(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
