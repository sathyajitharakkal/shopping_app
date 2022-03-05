
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layered_arc/shopping/features/home/bloc/home_cubit.dart';
import 'package:layered_arc/shopping/features/home/ui/home_screen.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

class HomeScreenRouteBuilder{
  final ServiceLocator serviceLocator;

  HomeScreenRouteBuilder(this.serviceLocator);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(serviceLocator)),
      ],
      child: MultiRepositoryProvider(providers: [
        RepositoryProvider.value(value: serviceLocator.navigationService),
      ], child: HomeScreen()),
    );
  }
}