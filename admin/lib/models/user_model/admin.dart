class Admin {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final bool? isAdmin;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Admin({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isAdmin,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        password: json['password'] as String?,
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
        'isAdmin': isAdmin,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  List<Object?> get props {
    return [
      id,
      name,
      email,
      password,
      isAdmin,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
