import 'student.dart';

class StudentModel {
  String? status;
  dynamic message;
  List<Student>? student;

  StudentModel({this.status, this.message, this.student});

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        status: json['status'] as String?,
        message: json['message'] as String?,
        student: (json['student'] as List<dynamic>?)
            ?.map((e) => Student.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'student': student?.map((e) => e.toJson()).toList(),
      };
}
