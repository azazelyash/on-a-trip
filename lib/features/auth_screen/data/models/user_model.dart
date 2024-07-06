class UserModel {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? profile;
  String? userType;
  dynamic otherDetails;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.profile,
    this.userType,
    this.otherDetails,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profile: json['profile'],
      userType: json['user_type'],
      otherDetails: json['other_details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile': profile,
      'user_type': userType,
      'other_details': otherDetails,
    };
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    int? phone,
    String? profile,
    String? userType,
    dynamic otherDetails,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profile: profile ?? this.profile,
      userType: userType ?? this.userType,
      otherDetails: otherDetails ?? this.otherDetails,
    );
  }
}
