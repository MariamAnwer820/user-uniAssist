import 'profile_photo.dart';

class AcadmicSatff {
	String? id;
	String? name;
	String? email;
	String? password;
	List<dynamic>? subject;
	ProfilePhoto? profilePhoto;
	String? addedBy;
	String? role;
	bool? isAdmin;
	int? v;
	DateTime? createdAt;
	DateTime? updatedAt;

	AcadmicSatff({
		this.id, 
		this.name, 
		this.email, 
		this.password, 
		this.subject, 
		this.profilePhoto, 
		this.addedBy, 
		this.role, 
		this.isAdmin, 
		this.v, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory AcadmicSatff.fromJson(Map<String, dynamic> json) => AcadmicSatff(
				id: json['_id'] as String?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				subject: json['subject'] as List<dynamic>?,
				profilePhoto: json['profilePhoto'] == null
						? null
						: ProfilePhoto.fromJson(json['profilePhoto'] as Map<String, dynamic>),
				addedBy: json['addedBy'] as String?,
				role: json['role'] as String?,
				isAdmin: json['isAdmin'] as bool?,
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
				'name': name,
				'email': email,
				'password': password,
				'subject': subject,
				'profilePhoto': profilePhoto?.toJson(),
				'addedBy': addedBy,
				'role': role,
				'isAdmin': isAdmin,
				'__v': v,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
			};
}
