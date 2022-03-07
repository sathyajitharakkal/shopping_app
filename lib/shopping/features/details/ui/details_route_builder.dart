import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layered_arc/shopping/features/details/bloc/details_cubit.dart';
import 'package:layered_arc/shopping/features/details/ui/details.dart';
import 'package:layered_arc/shopping/models/movies_response.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

class DetailsScreenRouteBuilder{
  final ServiceLocator serviceLocator;
  final ProductResponse movie;
  DetailsScreenRouteBuilder(this.serviceLocator, this.movie);

  Widget call(BuildContext context){
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailsCubit(serviceLocator, movie)),
      ], child: DetailsScreen(),
    );
  }
}