import 'package:admin_interface22/cubits/subject_cubit/subject_state.dart';
import 'package:admin_interface22/models/viewsubject/viewsubject.dart';
import 'package:admin_interface22/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.apiService) : super(SubjectInitial());

  final ApiService apiService;
  addSubject({
    required String subjectTitle,
    required String subjectId,
    required String subjectNumberOfHours,
  }) async {
    emit(AddingSubjectLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.addingSubject(
        endPoint: '/admin/add-subject',
        subjectTitle: subjectTitle,
        subjectId: subjectId,
        subjectNumberOfHours: subjectNumberOfHours,
      );

      emit(AddingSubjectSuccessState());
    } on DioException catch (e) {
      emit(
        AddingSubjectErrorState(e.toString()),
      );
    }
  }



  delSubject({
    required String subjectId,
  }) async {
    emit(delingSubjectLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.delingSubject(
        endPoint: '/admin/delete-subject',
        subjectId: subjectId,
      );

      emit(delingSubjectSuccessState());
    } on DioException catch (e) {
      emit(
        delingSubjectErrorState(e.toString()),
      );
    }
  }

  viewSubject() async {
    emit(viewSubjectLoadingState());

    try {
      // ignore: unused_local_variable
      Response response = await apiService.viewSubject(
        endPoint: '/admin/show-all-subjects',
      
      );
      // ignore: unused_local_variable
      Viewsubject viewsubject = Viewsubject.fromJson(response.data);
      emit(viewSubjectSuccessState(viewsubject));
    } on DioException catch (e) {
      emit(
        viewSubjectErrorState(e.toString()),
      );
    }
  }
}
