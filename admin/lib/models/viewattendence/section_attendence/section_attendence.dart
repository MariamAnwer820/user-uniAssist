import 'attendance_array.dart';

class SectionAttendence {
	String? status;
	String? message;
	List<AttendanceArray>? attendanceArray;

	SectionAttendence({this.status, this.message, this.attendanceArray});

	factory SectionAttendence.fromJson(Map<String, dynamic> json) {
		return SectionAttendence(
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
