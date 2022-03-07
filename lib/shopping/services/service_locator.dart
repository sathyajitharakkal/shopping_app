import 'package:api/api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:layered_arc/shopping/navigation/navigation.dart';

// abstract class CubitsLocator {
//   HomeCubit get HomeCubit;

//   void resetCubits();

//   void configCubits();
// } 

class ServiceLocator {
  final GetIt _registry;
  final String baseUrl;

  ServiceLocator({required this.baseUrl}) : _registry = GetIt.asNewInstance();

  NavigationService get navigationService => _registry.get<NavigationService>();

  API get api => _registry.get<API>();

  void config() {
    _registry.registerLazySingleton(
      () => NavigationService(),
    );

    _registry.registerLazySingleton(
      () => API.create(baseUrl: baseUrl),
    );
  }

  void reset() {
    _registry.resetLazySingleton(instance: navigationService);
    _registry.resetLazySingleton(instance: api);
  }
}
