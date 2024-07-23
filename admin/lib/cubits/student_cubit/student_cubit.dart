import 'package:admin_interface22/cubits/student_cubit/student_state.dart';
// ignore: unused_import
import 'package:admin_interface22/models/student_model/student_model.dart';
import 'package:admin_interface22/models/viewstudent/viewstudent.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this.apiService) : super(StudentInitial());
  final ApiService apiService;
  addStudent({
    required String studentName,
    required String studentEmail,
    required String studentPassword,
    required String studentLevel,
  }) async {
    emit(AddStudentLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.addStudent(
        endPoint: '/admin/Add-Student',
        studentName: studentName,
        studentEmail: studentEmail,
        studentPassword: studentPassword,
        studentLevel: studentLevel,
      );
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(AddStudentSuccessState());
    } on DioException catch (e) {
      emit(AddStudentErrorState(e.toString()));
    }
  }

  delStudent({
    required String studentEmail,
  }) async {
    emit(delStudentLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.delStudent(
        endPoint: '/admin/delte-student',
        studentEmail: studentEmail,
      );
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(delStudentSuccessState());
    } on DioException catch (e) {
      emit(delStudentErrorState(e.toString()));
    }
  }



  viewStudent() async {
    emit(viewStudentLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewStudent(
        endPoint: '/admin/show-all-student',
      );
      // ignore: unused_local_variable
      Viewstudent viewstu =Viewstudent.fromJson(response.data);
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(viewStudentSuccessState(viewstu));
    } on DioException catch (e) {
      emit(viewStudentErrorState(e.toString()));
    }
  }



  delallStudent({
    required String level,
  }) async {
    emit(delallStudentLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.delallStudent(
        endPoint: '/admin/deleteStudentsAtSpecificLevel',
        level: level,
      );
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(delallStudentSuccessState());
    } on DioException catch (e) {
      emit(delallStudentErrorState(e.toString()));
    }
  }

}
