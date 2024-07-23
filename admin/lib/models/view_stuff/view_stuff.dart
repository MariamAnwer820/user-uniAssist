import 'acadmic_satff.dart';

class ViewStuff {
	String? status;
	String? message;
	List<AcadmicSatff>? acadmicSatff;

	ViewStuff({this.status, this.message, this.acadmicSatff});

	factory ViewStuff.fromJson(Map<String, dynamic> json) => ViewStuff(
				status: json['status'] as String?,
				message: json['message'] as String?,
				acadmicSatff: (json['acadmicSatff'] as List<dynamic>?)
						?.map((e) => AcadmicSatff.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'message': message,
				'acadmicSatff': acadmicSatff?.map((e) => e.toJson()).toList(),
			};
}
