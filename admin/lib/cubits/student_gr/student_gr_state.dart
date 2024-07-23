//import 'package:admin_interface22/models/student_model/student_model.dart';

import 'package:admin_interface22/models/show_grst_umodel/show_grst_umodel.dart';

class StudentGRState {}

class StudentGRInitial extends StudentGRState {}

class AddStudentGRLoadingState extends StudentGRState {}

class AddStudentGRSuccessState extends StudentGRState {

}

class AddStudentGRErrorState extends StudentGRState {
  final String error;

  AddStudentGRErrorState(this.error);
}



class delStudentGRLoadingState extends StudentGRState {}

class delStudentGRSuccessState extends StudentGRState {
 
}

class delStudentGRErrorState extends StudentGRState {
  final String error;

  delStudentGRErrorState(this.error);
}


class viewStudentGRLoadingState extends StudentGRState {}

class viewStudentGRSuccessState extends StudentGRState {
    ShowGrstUmodel showgrstu ;
    viewStudentGRSuccessState(this.showgrstu);
}

class viewStudentGRErrorState extends StudentGRState {
  final String error;

  viewStudentGRErrorState(this.error);
}

class moveGRstudentLoadingState extends StudentGRState {}

class moveGRstudentSuccessState extends StudentGRState {
  final String message;
  moveGRstudentSuccessState(this.message);
   
}

class moveGRstudentErrorState extends StudentGRState {
  final String error;

  moveGRstudentErrorState(this.error);
}