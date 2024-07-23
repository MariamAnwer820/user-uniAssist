import 'package:admin_interface22/models/viewsubject/viewsubject.dart';

class SubjectState {}

class SubjectInitial extends SubjectState {}

class AddingSubjectLoadingState extends SubjectState {}

class AddingSubjectSuccessState extends SubjectState {
  
}

class AddingSubjectErrorState extends SubjectState {
  final String error;

  AddingSubjectErrorState(this.error);
}

class delingSubjectLoadingState extends SubjectState {}

class delingSubjectSuccessState extends SubjectState {
  
}

class delingSubjectErrorState extends SubjectState {
  final String error;

  delingSubjectErrorState(this.error);
}

class viewSubjectLoadingState extends SubjectState {}

class viewSubjectSuccessState extends SubjectState {
  Viewsubject viewsubject;
  viewSubjectSuccessState(this.viewsubject);
}

class viewSubjectErrorState extends SubjectState {
  final String error;

  viewSubjectErrorState(this.error);
}