
import 'package:admin_interface22/cubits/stuff/stuff_state.dart';
// ignore: unused_import
import 'package:admin_interface22/models/student_model/student_model.dart';
import 'package:admin_interface22/models/view_stuff/view_stuff.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StuffCubit extends Cubit<StuffState> {
  StuffCubit(this.apiService) : super(StuffInitial());
  final ApiService apiService;
  addStuff({
    required String stuffName,
    required String stuffEmail,
    required String stuffPassword,
     required List<String> subject,
  }) async {
    emit(AddStuffLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.addStuff(
        endPoint: '/admin/add-profOrProfAssist',
        stuffName: stuffName,
        stuffEmail: stuffEmail,
        stuffPassword: stuffPassword,
        subject: subject,
      );
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(AddStuffSuccessState());
    } on DioException catch (e) {
      emit(AddStuffErrorState(e.toString()));
    }
  }

  delStuff({
    required String stuffEmail,
  }) async {
    emit(delStuffLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.delStuff(
        endPoint: '/admin/delete-single-acadmic-staff',
        stuffEmail: stuffEmail,
      );
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(delStuffSuccessState());
    } on DioException catch (e) {
      emit(delStuffErrorState(e.toString()));
    }
  }



  viewStuff() async {
    emit(viewStuffLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewStuff(
        endPoint: '/admin/show-all-acadmic-staff',
      );
      // ignore: unused_local_variable
       ViewStuff stuffModel = ViewStuff.fromJson(response.data);
      emit(viewStuffSuccessState(
        stuffModel
      ));
    } on DioException catch (e) {
      emit(viewStuffErrorState(e.toString()));
    }
  }
}
