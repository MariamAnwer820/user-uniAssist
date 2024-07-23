import 'message.dart';

class ShowGrstUmodel {
	String? status;
	List<Message>? message;
	int? graduationStudentCount;

	ShowGrstUmodel({this.status, this.message, this.graduationStudentCount});

	factory ShowGrstUmodel.fromJson(Map<String, dynamic> json) {
		return ShowGrstUmodel(
			status: json['status'] as String?,
			message: (json['message'] as List<dynamic>?)
						?.map((e) => Message.fromJson(e as Map<String, dynamic>))
						.toList(),
			graduationStudentCount: json['graduationStudentCount'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message?.map((e) => e.toJson()).toList(),
				'graduationStudentCount': graduationStudentCount,
			};
}
