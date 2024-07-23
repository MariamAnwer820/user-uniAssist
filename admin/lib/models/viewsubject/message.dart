class Message {
	String? id;
	String? title;
	String? idsb;
	String? numberOfHours;
	List<String>? lectures;
	List<String>? sections;
	List<dynamic>? teachedBy;
	String? addedBy;
	List<dynamic>? lectureAttendance;
	List<dynamic>? sectionAttendance;
	int? v;
	DateTime? createdAt;
	DateTime? updatedAt;

	Message({
		this.id, 
		this.title, 
		this.idsb, 
		this.numberOfHours, 
		this.lectures, 
		this.sections, 
		this.teachedBy, 
		this.addedBy, 
		this.lectureAttendance, 
		this.sectionAttendance, 
		this.v, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Message.fromJson(Map<String, dynamic> json) => Message(
				id: json['_id'] as String?,
				title: json['title'] as String?,
				idsb: json['ID'] as String?,
				numberOfHours: json['numberOfHours'] as String?,
        lectures: (json['lectures'] as List<dynamic>?)?.map((item) => item as String).toList(),
		  sections: (json['sections'] as List<dynamic>?)?.map((item) => item as String).toList(),
				teachedBy: json['teachedBy'] as List<dynamic>?,
				addedBy: json['addedBy'] as String?,
				lectureAttendance: json['lectureAttendance'] as List<dynamic>?,
				sectionAttendance: json['sectionAttendance'] as List<dynamic>?,
				v: json['__v'] as int?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'_id': id,
				'title': title,
				'ID': id,
				'numberOfHours': numberOfHours,
				'lectures': lectures,
				'sections': sections,
				'teachedBy': teachedBy,
				'addedBy': addedBy,
				'lectureAttendance': lectureAttendance,
				'sectionAttendance': sectionAttendance,
				'__v': v,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
			};
}
