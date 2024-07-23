import 'package:admin_interface22/models/user_model/user_model.dart';

class AuthState {}

class AuthInitialState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserModel userModel;
  LoginSuccessState(this.userModel);

  //final String message;
  //LoginSuccessState(this.message);
   
}

class LoginErrorState extends AuthState {
  final String errorMessage;

  LoginErrorState(this.errorMessage);
}

class LogoutLoadingState extends AuthState {}

class LogoutSuccessState extends AuthState {}

class LogoutErrorState extends AuthState {
  final String errorMessage;

  LogoutErrorState(this.errorMessage);
}
