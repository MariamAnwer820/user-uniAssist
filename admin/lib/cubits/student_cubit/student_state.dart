// ignore: unused_import
import 'package:admin_interface22/models/student_model/student_model.dart';
import 'package:admin_interface22/models/viewstudent/viewstudent.dart';

class StudentState {}

class StudentInitial extends StudentState {}

class AddStudentLoadingState extends StudentState {}

class AddStudentSuccessState extends StudentState {
 
}

class AddStudentErrorState extends StudentState {
  final String error;

  AddStudentErrorState(this.error);
}


class delStudentLoadingState extends StudentState {}

class delStudentSuccessState extends StudentState {

}

class delStudentErrorState extends StudentState {
  final String error;

  delStudentErrorState(this.error);
}


class viewStudentLoadingState extends StudentState {}

class viewStudentSuccessState extends StudentState {
  Viewstudent viewstu;
  viewStudentSuccessState(this.viewstu);
}

class viewStudentErrorState extends StudentState {
  final String error;

  viewStudentErrorState(this.error);
}


class delallStudentLoadingState extends StudentState {}

class delallStudentSuccessState extends StudentState {
  
}

class delallStudentErrorState extends StudentState {
  final String error;

  delallStudentErrorState(this.error);
}