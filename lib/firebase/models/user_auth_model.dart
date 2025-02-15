class UserAuthModel {
  String? id;
  String? email;
  String? name;
  String? phone;
  String? gender;

  UserAuthModel({
    this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.gender,
  });

  UserAuthModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          name: json['name'],
          phone: json['phone'],
          gender: json['gender'],
        );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['gender'] = gender;
    return data;
  }
}
