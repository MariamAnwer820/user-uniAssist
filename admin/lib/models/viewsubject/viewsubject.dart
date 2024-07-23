import 'message.dart';

class Viewsubject {
	String? status;
	int? subjectsCount;
	List<Message>? message;

	Viewsubject({this.status, this.subjectsCount, this.message});

	factory Viewsubject.fromJson(Map<String, dynamic> json) => Viewsubject(
				status: json['status'] as String?,
				subjectsCount: json['subjectsCount'] as int?,
				message: (json['message'] as List<dynamic>?)
						?.map((e) => Message.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'subjectsCount': subjectsCount,
				'message': message?.map((e) => e.toJson()).toList(),
			};
}
