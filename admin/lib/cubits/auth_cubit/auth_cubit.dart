import 'package:admin_interface22/cubits/auth_cubit/auth_state.dart';
import 'package:admin_interface22/models/user_model/user_model.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiService) : super(AuthInitialState());
  final ApiService apiService;
  userLogin({
    required String userEmail,
    required String userPassword,
  }) async {
    emit(LoginLoadingState());

    try {
      Response response = await apiService.loginUser(
        endPoint: '/admin/login',
        userEmail: userEmail,
        userPassword: userPassword,
      );
      UserModel userModel = UserModel.fromJson(response.data);
      print(userModel.token);
      emit(LoginSuccessState(userModel));
    } on DioException catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}
