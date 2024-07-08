class OfferModel {
  int? id;
  String? title;
  String? description;
  int? likes;
  int? reviews;
  int? rate;
  List<dynamic>? gallery;
  Venue? venue;
  List<dynamic>? services;

  OfferModel(
      {this.id,
      this.title,
      this.description,
      this.likes,
      this.reviews,
      this.rate,
      this.gallery,
      this.venue,
      this.services});

  OfferModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    likes = json["likes"];
    reviews = json["reviews"];
    rate = json["rate"];
    gallery = json["gallery"] ?? [];
    venue = json["venue"] == null ? null : Venue.fromJson(json["venue"]);
    services = json["services"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["likes"] = likes;
    data["reviews"] = reviews;
    data["rate"] = rate;
    if (gallery != null) {
      data["gallery"] = gallery;
    }
    if (venue != null) {
      data["venue"] = venue?.toJson();
    }
    if (services != null) {
      data["services"] = services;
    }
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? description;
  String? bio;
  User? user;
  City1? city;
  String? type;
  String? specializationType;
  String? gender;
  int? teamNum;
  String? foundedIn;
  String? location;
  String? address;
  String? latLocation;
  String? longLocation;
  String? phoneNumber;
  String? facebookLink;
  String? whatsappNumber;
  String? instagramLink;
  String? status;
  int? isAvailable;
  int? isOpen;
  dynamic venueCode;
  int? likes;
  int? reviews;
  int? rate;
  String? profileImage;

  Venue(
      {this.id,
      this.name,
      this.description,
      this.bio,
      this.user,
      this.city,
      this.type,
      this.specializationType,
      this.gender,
      this.teamNum,
      this.foundedIn,
      this.location,
      this.address,
      this.latLocation,
      this.longLocation,
      this.phoneNumber,
      this.facebookLink,
      this.whatsappNumber,
      this.instagramLink,
      this.status,
      this.isAvailable,
      this.isOpen,
      this.venueCode,
      this.likes,
      this.reviews,
      this.rate,
      this.profileImage});

  Venue.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    bio = json["bio"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    city = json["city"] == null ? null : City1.fromJson(json["city"]);
    type = json["type"];
    specializationType = json["specializationType"];
    gender = json["gender"];
    teamNum = json["teamNum"];
    foundedIn = json["foundedIn"];
    location = json["location"];
    address = json["address"];
    latLocation = json["latLocation"];
    longLocation = json["longLocation"];
    phoneNumber = json["phoneNumber"];
    facebookLink = json["facebookLink"];
    whatsappNumber = json["whatsappNumber"];
    instagramLink = json["instagramLink"];
    status = json["status"];
    isAvailable = json["isAvailable"];
    isOpen = json["isOpen"];
    venueCode = json["venueCode"];
    likes = json["likes"];
    reviews = json["reviews"];
    rate = json["rate"];
    profileImage = json["profileImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["bio"] = bio;
    if (user != null) {
      data["user"] = user?.toJson();
    }
    if (city != null) {
      data["city"] = city?.toJson();
    }
    data["type"] = type;
    data["specializationType"] = specializationType;
    data["gender"] = gender;
    data["teamNum"] = teamNum;
    data["foundedIn"] = foundedIn;
    data["location"] = location;
    data["address"] = address;
    data["latLocation"] = latLocation;
    data["longLocation"] = longLocation;
    data["phoneNumber"] = phoneNumber;
    data["facebookLink"] = facebookLink;
    data["whatsappNumber"] = whatsappNumber;
    data["instagramLink"] = instagramLink;
    data["status"] = status;
    data["isAvailable"] = isAvailable;
    data["isOpen"] = isOpen;
    data["venueCode"] = venueCode;
    data["likes"] = likes;
    data["reviews"] = reviews;
    data["rate"] = rate;
    data["profileImage"] = profileImage;
    return data;
  }
}

class City1 {
  int? id;
  String? name;

  City1({this.id, this.name});

  City1.fromJson(Map<String, dynamic> json) {
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

class User {
  int? id;
  String? name;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  City? city;

  User(
      {this.id,
      this.name,
      this.lastName,
      this.email,
      this.phone,
      this.image,
      this.city});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    lastName = json["lastName"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    city = json["city"] == null ? null : City.fromJson(json["city"]);
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
