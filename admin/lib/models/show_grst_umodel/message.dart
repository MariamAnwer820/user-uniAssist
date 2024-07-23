import 'profile_photo.dart';

class Message {
	String? id;
	String? name;
	String? email;
	String? password;
	String? level;
	ProfilePhoto? profilePhoto;
	String? addedBy;
	bool? isAdmin;
	int? v;
	DateTime? createdAt;
	DateTime? updatedAt;

	Message({
		this.id, 
		this.name, 
		this.email, 
		this.password, 
		this.level, 
		this.profilePhoto, 
		this.addedBy, 
		this.isAdmin, 
		this.v, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Message.fromJson(Map<String, dynamic> json) => Message(
				id: json['_id'] as String?,
				name: json['name'] as String?,
				email: json['email'] as String?,
				password: json['password'] as String?,
				level: json['level'] as String?,
				profilePhoto: json['profilePhoto'] == null
						? null
						: ProfilePhoto.fromJson(json['profilePhoto'] as Map<String, dynamic>),
				addedBy: json['addedBy'] as String?,
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
				'level': level,
				'profilePhoto': profilePhoto?.toJson(),
				'addedBy': addedBy,
				'isAdmin': isAdmin,
				'__v': v,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
			};
}
