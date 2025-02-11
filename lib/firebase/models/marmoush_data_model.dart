class MarmoushDataModel {
  String? id;
  String name = "Omar Marmoush";
  String phone = "+201286952813";
  String coach = "Hassan Shehata";
  String weight = "80";
  String height = "180";
  String lacticAcid = "1";
  String city = "Cairo";

  MarmoushDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    coach = json['coach'];
    weight = json['weight'];
    height = json['height'];
    lacticAcid = json['lacticAcid'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['coach'] = coach;
    data['weight'] = weight;
    data['height'] = height;
    data['lacticAcid'] = lacticAcid;
    data['city'] = city;
    return data;
  }
}
