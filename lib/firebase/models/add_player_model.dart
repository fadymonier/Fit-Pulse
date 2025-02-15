class AddPlayerDataModel {
  String? id;
  String? imageUrl;
  String? name;
  String? gender;
  String? phone;
  String? age;
  String? coach;
  String? weight;
  String? height;
  String? lacticAcid;
  String? city;
  String? userId;

  AddPlayerDataModel({
    this.id,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.phone,
    required this.age,
    required this.coach,
    required this.weight,
    required this.height,
    required this.lacticAcid,
    required this.city,
    required this.userId,
  });

  AddPlayerDataModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        imageUrl = json['imageUrl'] ?? "",
        name = json['name'] ?? "",
        gender = json['gender'] ?? "",
        phone = json['phone'] ?? "",
        age = json['age'] ?? "",
        coach = json['coach'] ?? "",
        weight = json['weight'] ?? "",
        height = json['height'] ?? "",
        lacticAcid = json['lacticAcid'] ?? "",
        city = json['city'] ?? "",
        userId = json['userId'] ?? "";

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'gender': gender,
      'phone': phone,
      'age': age,
      'coach': coach,
      'weight': weight,
      'height': height,
      'lacticAcid': lacticAcid,
      'city': city,
      'userId': userId
    };
  }
}
