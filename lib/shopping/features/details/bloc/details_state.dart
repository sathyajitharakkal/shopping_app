part of 'details_cubit.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {
  ProductResponse productResponse;
  int count;

  DetailsInitial(this.productResponse,this.count);
  
}


