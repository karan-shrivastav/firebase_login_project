// To parse this JSON data, do
//
//     final gymDataModel = gymDataModelFromJson(jsonString);

import 'dart:convert';

GymDataModel gymDataModelFromJson(String str) => GymDataModel.fromJson(json.decode(str));

String gymDataModelToJson(GymDataModel data) => json.encode(data.toJson());

class GymDataModel {
  final bool? status;
  final String? message;
  final String? messageIos;
  final List<CityList>? cityList;
  final List<GymDataList>? data;

  GymDataModel({
    this.status,
    this.message,
    this.messageIos,
    this.cityList,
    this.data,
  });

  GymDataModel copyWith({
    bool? status,
    String? message,
    String? messageIos,
    List<CityList>? cityList,
    List<GymDataList>? data,
  }) =>
      GymDataModel(
        status: status ?? this.status,
        message: message ?? this.message,
        messageIos: messageIos ?? this.messageIos,
        cityList: cityList ?? this.cityList,
        data: data ?? this.data,
      );

  factory GymDataModel.fromJson(Map<String, dynamic> json) => GymDataModel(
    status: json["status"],
    message: json["message"],
    messageIos: json["message_ios"],
    cityList: json["city_list"] == null ? [] : List<CityList>.from(json["city_list"]!.map((x) => CityList.fromJson(x))),
    data: json["data"] == null ? [] : List<GymDataList>.from(json["data"]!.map((x) => GymDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ios": messageIos,
    "city_list": cityList == null ? [] : List<dynamic>.from(cityList!.map((x) => x.toJson())),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CityList {
  final int? id;
  final String? cityName;
  final double? geoLatitude;
  final double? geoLongitude;

  CityList({
    this.id,
    this.cityName,
    this.geoLatitude,
    this.geoLongitude,
  });

  CityList copyWith({
    int? id,
    String? cityName,
    double? geoLatitude,
    double? geoLongitude,
  }) =>
      CityList(
        id: id ?? this.id,
        cityName: cityName ?? this.cityName,
        geoLatitude: geoLatitude ?? this.geoLatitude,
        geoLongitude: geoLongitude ?? this.geoLongitude,
      );

  factory CityList.fromJson(Map<String, dynamic> json) => CityList(
    id: json["id"],
    cityName: json["city_name"],
    geoLatitude: json["geo_latitude"]?.toDouble(),
    geoLongitude: json["geo_longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_name": cityName,
    "geo_latitude": geoLatitude,
    "geo_longitude": geoLongitude,
  };
}

class GymDataList {
  final int? gymId;
  final String? gymName;
  final String? gymLogo;
  final List<String>? gymImages;
  final String? address;
  final String? cityName;
  final String? description;
  final String? howToGet;
  final String? partnerName;
  final String? partnerEmail;
  final String? partnerPhone;
  final String? phoneCode;
  final String? latitude;
  final String? longitude;
  final List<Amenity>? amenities;
  final List<String>? gymImages2;
  final String? open;
  final String? rating;
  final List<Category>? categories;
  final String? distance;
  final String? imgPath;
  final String? avaliableSlots;

  GymDataList({
    this.gymId,
    this.gymName,
    this.gymLogo,
    this.gymImages,
    this.address,
    this.cityName,
    this.description,
    this.howToGet,
    this.partnerName,
    this.partnerEmail,
    this.partnerPhone,
    this.phoneCode,
    this.latitude,
    this.longitude,
    this.amenities,
    this.gymImages2,
    this.open,
    this.rating,
    this.categories,
    this.distance,
    this.imgPath,
    this.avaliableSlots,
  });

  GymDataList copyWith({
    int? gymId,
    String? gymName,
    String? gymLogo,
    List<String>? gymImages,
    String? address,
    String? cityName,
    String? description,
    String? howToGet,
    String? partnerName,
    String? partnerEmail,
    String? partnerPhone,
    String? phoneCode,
    String? latitude,
    String? longitude,
    List<Amenity>? amenities,
    List<String>? gymImages2,
    String? open,
    String? rating,
    List<Category>? categories,
    String? distance,
    String? imgPath,
    String? avaliableSlots,
  }) =>
      GymDataList(
        gymId: gymId ?? this.gymId,
        gymName: gymName ?? this.gymName,
        gymLogo: gymLogo ?? this.gymLogo,
        gymImages: gymImages ?? this.gymImages,
        address: address ?? this.address,
        cityName: cityName ?? this.cityName,
        description: description ?? this.description,
        howToGet: howToGet ?? this.howToGet,
        partnerName: partnerName ?? this.partnerName,
        partnerEmail: partnerEmail ?? this.partnerEmail,
        partnerPhone: partnerPhone ?? this.partnerPhone,
        phoneCode: phoneCode ?? this.phoneCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        amenities: amenities ?? this.amenities,
        gymImages2: gymImages2 ?? this.gymImages2,
        open: open ?? this.open,
        rating: rating ?? this.rating,
        categories: categories ?? this.categories,
        distance: distance ?? this.distance,
        imgPath: imgPath ?? this.imgPath,
        avaliableSlots: avaliableSlots ?? this.avaliableSlots,
      );

  factory GymDataList.fromJson(Map<String, dynamic> json) => GymDataList(
    gymId: json["gym_id"],
    gymName: json["gym_name"],
    gymLogo: json["gym_logo"],
    gymImages: json["gym_images"] == null ? [] : List<String>.from(json["gym_images"]!.map((x) => x)),
    address: json["address"],
    cityName: json["city_name"],
    description: json["description"],
    howToGet: json["how_to_get"],
    partnerName: json["partner_name"],
    partnerEmail: json["partner_email"],
    partnerPhone: json["partner_phone"],
    phoneCode: json["phone_code"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
    gymImages2: json["gym_images2"] == null ? [] : List<String>.from(json["gym_images2"]!.map((x) => x)),
    open: json["open"],
    rating: json["rating"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    distance: json["distance"],
    imgPath: json["img_path"],
    avaliableSlots: json["avaliable_slots"],
  );

  Map<String, dynamic> toJson() => {
    "gym_id": gymId,
    "gym_name": gymName,
    "gym_logo": gymLogo,
    "gym_images": gymImages == null ? [] : List<dynamic>.from(gymImages!.map((x) => x)),
    "address": address,
    "city_name": cityName,
    "description": description,
    "how_to_get": howToGet,
    "partner_name": partnerName,
    "partner_email": partnerEmail,
    "partner_phone": partnerPhone,
    "phone_code": phoneCode,
    "latitude": latitude,
    "longitude": longitude,
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
    "gym_images2": gymImages2 == null ? [] : List<dynamic>.from(gymImages2!.map((x) => x)),
    "open": open,
    "rating": rating,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "distance": distance,
    "img_path": imgPath,
    "avaliable_slots": avaliableSlots,
  };
}

class Amenity {
  final int? id;
  final String? name;
  final String? icon;

  Amenity({
    this.id,
    this.name,
    this.icon,
  });

  Amenity copyWith({
    int? id,
    String? name,
    String? icon,
  }) =>
      Amenity(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    id: json["id"],
    name: json["name"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "icon": icon,
  };
}

class Category {
  final int? pricingId;
  final String? categoryName;
  final int? categoryId;
  final List<Price>? price;

  Category({
    this.pricingId,
    this.categoryName,
    this.categoryId,
    this.price,
  });

  Category copyWith({
    int? pricingId,
    String? categoryName,
    int? categoryId,
    List<Price>? price,
  }) =>
      Category(
        pricingId: pricingId ?? this.pricingId,
        categoryName: categoryName ?? this.categoryName,
        categoryId: categoryId ?? this.categoryId,
        price: price ?? this.price,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    pricingId: json["pricing_id"],
    categoryName: json["category_name"],
    categoryId: json["category_id"],
    price: json["price"] == null ? [] : List<Price>.from(json["price"]!.map((x) => Price.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pricing_id": pricingId,
    "category_name": categoryName,
    "category_id": categoryId,
    "price": price == null ? [] : List<dynamic>.from(price!.map((x) => x.toJson())),
  };
}

class Price {
  final int? hour;
  final int? rate;

  Price({
    this.hour,
    this.rate,
  });

  Price copyWith({
    int? hour,
    int? rate,
  }) =>
      Price(
        hour: hour ?? this.hour,
        rate: rate ?? this.rate,
      );

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    hour: json["hour"],
    rate: json["rate"],
  );

  Map<String, dynamic> toJson() => {
    "hour": hour,
    "rate": rate,
  };
}
