
import 'package:admin_interface22/models/view_stuff/view_stuff.dart';

class StuffState {}

class StuffInitial extends StuffState {}

class AddStuffLoadingState extends StuffState {}

class AddStuffSuccessState extends StuffState {
  
}

class AddStuffErrorState extends StuffState {
  final String error;

  AddStuffErrorState(this.error);
}


class delStuffLoadingState extends StuffState {}

class delStuffSuccessState extends StuffState {

}

class delStuffErrorState extends StuffState {
  final String error;

  delStuffErrorState(this.error);
}


class viewStuffLoadingState extends StuffState {}

class viewStuffSuccessState extends StuffState {
 ViewStuff viewStuff;
  viewStuffSuccessState(this.viewStuff);
}

class viewStuffErrorState extends StuffState {
  final String error;

  viewStuffErrorState(this.error);
}