class UserModel {
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  City? city;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.phone,
      this.image,
      this.city,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    lastName = json["lastName"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    city = json["city"] == null ? null : City.fromJson(json["city"]);
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["lastName"] = lastName;
    data["email"] = email;
    data["phone"] = phone;
    data["image"] = image;
    if (city != null) {
      data["city"] = city?.toJson();
    }
    data["token"] = token;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
