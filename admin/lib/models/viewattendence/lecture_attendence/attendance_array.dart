class AttendanceArray {
	String? subject;
	String? type;
	String? name;
	String? week1;
	String? week2;
	String? week3;
	String? week4;
	String? week5;
	String? week6;
	String? week7;
	int? total;

	AttendanceArray({
		this.subject, 
		this.type, 
		this.name, 
		this.week1, 
		this.week2, 
		this.week3, 
		this.week4, 
		this.week5, 
		this.week6, 
		this.week7, 
		this.total, 
	});

	factory AttendanceArray.fromJson(Map<String, dynamic> json) {
		return AttendanceArray(
			subject: json['subject'] as String?,
			type: json['type'] as String?,
			name: json['name'] as String?,
			week1: json['week1'] as String?,
			week2: json['week2'] as String?,
			week3: json['week3'] as String?,
			week4: json['week4'] as String?,
			week5: json['week5'] as String?,
			week6: json['week6'] as String?,
			week7: json['week7'] as String?,
			total: json['total'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'subject': subject,
				'type': type,
				'name': name,
				'week1': week1,
				'week2': week2,
				'week3': week3,
				'week4': week4,
				'week5': week5,
				'week6': week6,
				'week7': week7,
				'total': total,
			};
}
