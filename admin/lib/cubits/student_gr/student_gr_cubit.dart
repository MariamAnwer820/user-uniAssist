import 'package:admin_interface22/cubits/student_gr/student_gr_state.dart';
import 'package:admin_interface22/models/show_grst_umodel/show_grst_umodel.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentGrCubit extends Cubit<StudentGRState> {
  StudentGrCubit(this.apiService) : super(StudentGRInitial());

  final ApiService apiService;
  addStudenGR({
    required String studentName,
    required String studentEmail,
    required String studentPassword,
    required String studentRepeatPassword,
  }) async {
    emit(AddStudentGRLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.addStudentGR(
        endPoint: '/admin/add-graduation-student',
        studentName: studentName,
        studentEmail: studentEmail,
        studentPassword: studentPassword,
        studentRepeatPassword:studentRepeatPassword,
      );

      emit(AddStudentGRSuccessState());
    } on DioException catch (e) {
      emit(
        AddStudentGRErrorState(e.toString()),
      );
    }
  }


  delStudenGR({
    required String studentEmail,
  }) async {
    emit(delStudentGRLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.delStudentGR(
        endPoint: '/admin/delte-graduation-student',
        studentEmail: studentEmail,
      );

      emit(delStudentGRSuccessState());
    } on DioException catch (e) {
      emit(
        delStudentGRErrorState(e.toString()),
      );
    }
  }


  viewStudenGR() async {
    emit(viewStudentGRLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewStudentGR(
        endPoint: '/admin/show-all-graduation-student',
      );
       // ignore: unused_local_variable
       ShowGrstUmodel showgrstu =ShowGrstUmodel.fromJson(response.data);
      emit(viewStudentGRSuccessState(showgrstu));
    } on DioException catch (e) {
      emit(
        viewStudentGRErrorState(e.toString()),
      );
    }
  }
   

  moveGRstudent() async {
    emit(moveGRstudentLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.moveGRstudent(
        endPoint: '/admin/move-to-graduation-level',
      );
      if (response.statusCode == 200) {
        emit(moveGRstudentSuccessState(response.data['message']));
      } else {
        emit(moveGRstudentErrorState("Failed with status code: ${response.statusCode}"));
      }

      //emit(moveGRstudentSuccessState());
    } on DioException catch (e) {
      emit(
        moveGRstudentErrorState(e.toString()),
      );
    }
  }


}
