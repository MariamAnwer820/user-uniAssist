import 'attendance_array.dart';

class LectureAttendence {
	String? status;
	String? message;
	List<AttendanceArray>? attendanceArray;

	LectureAttendence({this.status, this.message, this.attendanceArray});

	factory LectureAttendence.fromJson(Map<String, dynamic> json) {
		return LectureAttendence(
			status: json['status'] as String?,
			message: json['message'] as String?,
			attendanceArray: (json['attendanceArray'] as List<dynamic>?)
						?.map((e) => AttendanceArray.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'attendanceArray': attendanceArray?.map((e) => e.toJson()).toList(),
			};
}
