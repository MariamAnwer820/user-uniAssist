import 'package:admin_interface22/cubits/viewatt_cubit/viewattendence_state.dart';
import 'package:admin_interface22/models/viewattendence/lecture_attendence/lecture_attendence.dart';
import 'package:admin_interface22/models/viewattendence/section_attendence/section_attendence.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewattendenceCubit extends Cubit<ViewattendenceState> {
  ViewattendenceCubit(this.apiService) : super(ViewattendenceInitial());

  final ApiService apiService;
  viewAttendencelecture({
    required String subjectTitle,
   
  }) async {
    emit(ViewattendencelectureLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewAttendencelecture(
        endPoint: '/admin/attendance/view-lecture-attendance',
        subjectTitle: subjectTitle,
      );
       // ignore: unused_local_variable
       LectureAttendence LECattendence =LectureAttendence.fromJson(response.data);
      emit(ViewattendencelectureSuccessState(LECattendence));
    } on DioException catch (e) {
      emit(
        ViewattendencelectureErrorState(e.toString()),
      );
    }
  }

  viewAttendencesection({
    required String subjectTitle,
   
  }) async {
    emit(ViewattendencesectionLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewAttendencesection(
        endPoint: '/admin/attendance/view-section-attendance',
        subjectTitle: subjectTitle,
      );
        // ignore: unused_local_variable
        SectionAttendence SECattendence =SectionAttendence.fromJson(response.data);
      emit(ViewattendencesectionSuccessState(SECattendence));
    } on DioException catch (e) {
      emit(
        ViewattendencesectionErrorState(e.toString()),
      );
    }
  }
}