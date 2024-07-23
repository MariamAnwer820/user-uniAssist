import 'package:admin_interface22/models/viewattendence/lecture_attendence/lecture_attendence.dart';
import 'package:admin_interface22/models/viewattendence/section_attendence/section_attendence.dart';

class ViewattendenceState {}

final class ViewattendenceInitial extends ViewattendenceState {}

class ViewattendencelectureLoadingState extends  ViewattendenceState {}

class ViewattendencelectureSuccessState extends  ViewattendenceState {
  LectureAttendence LECattendence;
  ViewattendencelectureSuccessState(this.LECattendence);
}

class ViewattendencelectureErrorState extends  ViewattendenceState {
  final String error;

  ViewattendencelectureErrorState(this.error);
}


class ViewattendencesectionLoadingState extends  ViewattendenceState {}

class ViewattendencesectionSuccessState extends  ViewattendenceState {
  SectionAttendence SECattendence;
  ViewattendencesectionSuccessState(this.SECattendence);
}

class ViewattendencesectionErrorState extends  ViewattendenceState {
  final String error;

  ViewattendencesectionErrorState(this.error);
}