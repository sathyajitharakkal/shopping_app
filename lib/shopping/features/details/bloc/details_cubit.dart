import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:layered_arc/shopping/models/movies_response.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final ServiceLocator serviceLocator;
  final ProductResponse productResponse;
  DetailsCubit(this.serviceLocator, this.productResponse) : super(DetailsInitial(productResponse, 1));

  back(BuildContext context){
    serviceLocator.navigationService.back(context);
  }

  add(){
    int count = (state as DetailsInitial).count + 1;
    print("Count = "+count.toString());
    emit(DetailsInitial(productResponse, count));
  }

  remove(){
    int count = (state as DetailsInitial).count - 1;
    if(count > 0){
    print("Count = "+count.toString());
    emit(DetailsInitial(productResponse, count));
    }
  }
}
