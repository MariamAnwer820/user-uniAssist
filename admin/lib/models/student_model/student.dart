import 'profile_photo.dart';

class Student {
  String? name;
  String? email;
  String? password;
  String? level;
  ProfilePhoto? profilePhoto;
  String? addedBy;
  String? role;
  bool? isAdmin;
  String? id;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Student({
    this.name,
    this.email,
    this.password,
    this.level,
    this.profilePhoto,
    this.addedBy,
    this.role,
    this.isAdmin,
    this.id,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
        level: json['level'] as String?,
        profilePhoto: json['profilePhoto'] == null
            ? null
            : ProfilePhoto.fromJson(
                json['profilePhoto'] as Map<String, dynamic>),
        addedBy: json['addedBy'] as String?,
        role: json['role'] as String?,
        isAdmin: json['isAdmin'] as bool?,
        id: json['_id'] as String?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'level': level,
        'profilePhoto': profilePhoto?.toJson(),
        'addedBy': addedBy,
        'role': role,
        'isAdmin': isAdmin,
        '_id': id,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
