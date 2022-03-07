import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:layered_arc/shopping/models/movies_response.dart';
import 'package:layered_arc/shopping/services/service_locator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceLocator serviceLocator;
  HomeCubit(this.serviceLocator) : super(HomeInitial._()) {
    try {
      emit(HomeLoading());
      serviceLocator.api.getDataByLoc((data) {
      List<ProductResponse> productResponse = productResponseFromJson(data);
      emit(HomeLoaded(productResponse));
      }, "429");
      } catch (e) {
         emit(HomeError());
    }
  }

  getProductDetails({required String value}) {
    try {
      emit(HomeLoading());
      serviceLocator.api.getDataSearch((data) {
      List<ProductResponse> productResponse = productResponseFromJson(data);
      emit(HomeLoaded(productResponse));
      }, value);
    } catch (e) {
      emit(HomeError());
    }
  }

  openDetails(BuildContext context, ProductResponse productResponse) {
    serviceLocator.navigationService.openDetails(context, productResponse);
  }

  void release() {
    emit(HomeInitial._());
  }
}
