import 'message.dart';

class Viewstudent {
	String? status;
	List<Message>? message;
	int? studentsCount;

	Viewstudent({this.status, this.message, this.studentsCount});

	factory Viewstudent.fromJson(Map<String, dynamic> json) => Viewstudent(
				status: json['status'] as String?,
				message: (json['message'] as List<dynamic>?)
						?.map((e) => Message.fromJson(e as Map<String, dynamic>))
						.toList(),
				studentsCount: json['studentsCount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message?.map((e) => e.toJson()).toList(),
				'studentsCount': studentsCount,
			};
}
