class GymListByCategoryModel {
  bool? status;
  String? message;
  List<CategoryData>? data;

  GymListByCategoryModel({this.status, this.message, this.data});

  GymListByCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryData>[];
      json['data'].forEach((v) {
        data!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? gymId;
  String? gymName;
  String? gymLogo;
  List<String>? gymImages;
  String? address;
  String? description;
  String? howToGet;
  String? partnerName;
  String? partnerEmail;
  String? partnerPhone;
  String? phoneCode;
  String? avaliableSlots;
  List<Amenities>? amenities;
  List<String>? gymImages2;
  String? open;
  String? rating;
  List<CategoryListData>? categories;
  String? distance;
  String? imgPath;

  CategoryData(
      {this.gymId,
        this.gymName,
        this.gymLogo,
        this.gymImages,
        this.address,
        this.description,
        this.howToGet,
        this.partnerName,
        this.partnerEmail,
        this.partnerPhone,
        this.phoneCode,
        this.avaliableSlots,
        this.amenities,
        this.gymImages2,
        this.open,
        this.rating,
        this.categories,
        this.distance,
        this.imgPath});

  CategoryData.fromJson(Map<String, dynamic> json) {
    gymId = json['gym_id'];
    gymName = json['gym_name'];
    gymLogo = json['gym_logo'];
    gymImages = json['gym_images'].cast<String>();
    address = json['address'];
    description = json['description'];
    howToGet = json['how_to_get'];
    partnerName = json['partner_name'];
    partnerEmail = json['partner_email'];
    partnerPhone = json['partner_phone'];
    phoneCode = json['phone_code'];
    avaliableSlots = json['avaliable_slots'];
    if (json['amenities'] != null) {
      amenities = <Amenities>[];
      json['amenities'].forEach((v) {
        amenities!.add(Amenities.fromJson(v));
      });
    }
    gymImages2 = json['gym_images2'].cast<String>();
    open = json['open'];
    rating = json['rating'];
    if (json['categories'] != null) {
      categories = <CategoryListData>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryListData.fromJson(v));
      });
    }
    distance = json['distance'];
    imgPath = json['img_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gym_id'] = this.gymId;
    data['gym_name'] = this.gymName;
    data['gym_logo'] = this.gymLogo;
    data['gym_images'] = this.gymImages;
    data['address'] = this.address;
    data['description'] = this.description;
    data['how_to_get'] = this.howToGet;
    data['partner_name'] = this.partnerName;
    data['partner_email'] = this.partnerEmail;
    data['partner_phone'] = this.partnerPhone;
    data['phone_code'] = this.phoneCode;
    data['avaliable_slots'] = this.avaliableSlots;
    if (this.amenities != null) {
      data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
    }
    data['gym_images2'] = this.gymImages2;
    data['open'] = this.open;
    data['rating'] = this.rating;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['distance'] = this.distance;
    data['img_path'] = this.imgPath;
    return data;
  }
}

class Amenities {
  int? id;
  String? name;
  String? icon;

  Amenities({this.id, this.name, this.icon});

  Amenities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}

class CategoryListData {
  int? pricingId;
  String? categoryName;
  int? categoryId;
  List<Price>? price;

  CategoryListData({this.pricingId, this.categoryName, this.categoryId, this.price});

  CategoryListData.fromJson(Map<String, dynamic> json) {
    pricingId = json['pricing_id'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    if (json['price'] != null) {
      price = <Price>[];
      json['price'].forEach((v) {
        price!.add(Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pricing_id'] = this.pricingId;
    data['category_name'] = this.categoryName;
    data['category_id'] = this.categoryId;
    if (this.price != null) {
      data['price'] = this.price!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Price {
  int? hour;
  int? rate;

  Price({this.hour, this.rate});

  Price.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hour'] = this.hour;
    data['rate'] = this.rate;
    return data;
  }
}







// // To parse this JSON data, do
// //
// //     final gymListByCategoryModel = gymListByCategoryModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GymListByCategoryModel gymListByCategoryModelFromJson(String str) => GymListByCategoryModel.fromJson(json.decode(str));
//
// String gymListByCategoryModelToJson(GymListByCategoryModel data) => json.encode(data.toJson());
//
// class GymListByCategoryModel {
//   final bool? status;
//   final String? message;
//   final List<GymListByCategory>? data;
//
//   GymListByCategoryModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   GymListByCategoryModel copyWith({
//     bool? status,
//     String? message,
//     List<GymListByCategory>? data,
//   }) =>
//       GymListByCategoryModel(
//         status: status ?? this.status,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );
//
//   factory GymListByCategoryModel.fromJson(Map<String, dynamic> json) => GymListByCategoryModel(
//     status: json["status"],
//     message: json["message"],
//     data: json["data"] == null ? [] : List<GymListByCategory>.from(json["data"]!.map((x) => GymListByCategory.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class GymListByCategory {
//   final int? gymId;
//   final String? gymName;
//   final String? gymLogo;
//   final List<String>? gymImages;
//   final String? address;
//   final String? description;
//   final String? howToGet;
//   final String? partnerName;
//   final String? partnerEmail;
//   final String? partnerPhone;
//   final String? phoneCode;
//   final String? avaliableSlots;
//   final List<Amenity>? amenities;
//   final List<String>? gymImages2;
//   final String? open;
//   final Rating? rating;
//   final List<CategoryListData>? categories;
//   final Distance? distance;
//   final String? imgPath;
//
//   GymListByCategory({
//     this.gymId,
//     this.gymName,
//     this.gymLogo,
//     this.gymImages,
//     this.address,
//     this.description,
//     this.howToGet,
//     this.partnerName,
//     this.partnerEmail,
//     this.partnerPhone,
//     this.phoneCode,
//     this.avaliableSlots,
//     this.amenities,
//     this.gymImages2,
//     this.open,
//     this.rating,
//     this.categories,
//     this.distance,
//     this.imgPath,
//   });
//
//   GymListByCategory copyWith({
//     int? gymId,
//     String? gymName,
//     String? gymLogo,
//     List<String>? gymImages,
//     String? address,
//     String? description,
//     String? howToGet,
//     String? partnerName,
//     String? partnerEmail,
//     String? partnerPhone,
//     String? phoneCode,
//     String? avaliableSlots,
//     List<Amenity>? amenities,
//     List<String>? gymImages2,
//     String? open,
//     Rating? rating,
//     List<CategoryListData>? categories,
//     Distance? distance,
//     String? imgPath,
//   }) =>
//       GymListByCategory(
//         gymId: gymId ?? this.gymId,
//         gymName: gymName ?? this.gymName,
//         gymLogo: gymLogo ?? this.gymLogo,
//         gymImages: gymImages ?? this.gymImages,
//         address: address ?? this.address,
//         description: description ?? this.description,
//         howToGet: howToGet ?? this.howToGet,
//         partnerName: partnerName ?? this.partnerName,
//         partnerEmail: partnerEmail ?? this.partnerEmail,
//         partnerPhone: partnerPhone ?? this.partnerPhone,
//         phoneCode: phoneCode ?? this.phoneCode,
//         avaliableSlots: avaliableSlots ?? this.avaliableSlots,
//         amenities: amenities ?? this.amenities,
//         gymImages2: gymImages2 ?? this.gymImages2,
//         open: open ?? this.open,
//         rating: rating ?? this.rating,
//         categories: categories ?? this.categories,
//         distance: distance ?? this.distance,
//         imgPath: imgPath ?? this.imgPath,
//       );
//
//   factory GymListByCategory.fromJson(Map<String, dynamic> json) => GymListByCategory(
//     gymId: json["gym_id"],
//     gymName: json["gym_name"],
//     gymLogo: json["gym_logo"],
//     gymImages: json["gym_images"] == null ? [] : List<String>.from(json["gym_images"]!.map((x) => x)),
//     address: json["address"],
//     description: json["description"],
//     howToGet: json["how_to_get"],
//     partnerName: json["partner_name"],
//     partnerEmail: json["partner_email"],
//     partnerPhone: json["partner_phone"],
//     phoneCode: json["phone_code"],
//     avaliableSlots: json["avaliable_slots"],
//     amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
//     gymImages2: json["gym_images2"] == null ? [] : List<String>.from(json["gym_images2"]!.map((x) => x)),
//     open: json["open"],
//     rating: ratingValues.map[json["rating"]]!,
//     categories: json["categories"] == null ? [] : List<CategoryListData>.from(json["categories"]!.map((x) => CategoryListData.fromJson(x))),
//     distance: distanceValues.map[json["distance"]]!,
//     imgPath: json["img_path"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "gym_id": gymId,
//     "gym_name": gymName,
//     "gym_logo": gymLogo,
//     "gym_images": gymImages == null ? [] : List<dynamic>.from(gymImages!.map((x) => x)),
//     "address": address,
//     "description": description,
//     "how_to_get": howToGet,
//     "partner_name": partnerName,
//     "partner_email": partnerEmail,
//     "partner_phone": partnerPhone,
//     "phone_code": phoneCode,
//     "avaliable_slots": avaliableSlots,
//     "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
//     "gym_images2": gymImages2 == null ? [] : List<dynamic>.from(gymImages2!.map((x) => x)),
//     "open": open,
//     "rating": ratingValues.reverse[rating],
//     "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
//     "distance": distanceValues.reverse[distance],
//     "img_path": imgPath,
//   };
// }
//
// class Amenity {
//   final int? id;
//   final Name? name;
//   final String? icon;
//
//   Amenity({
//     this.id,
//     this.name,
//     this.icon,
//   });
//
//   Amenity copyWith({
//     int? id,
//     Name? name,
//     String? icon,
//   }) =>
//       Amenity(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         icon: icon ?? this.icon,
//       );
//
//   factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//     icon: json["icon"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//     "icon": icon,
//   };
// }
//
// enum Name {
//   AEROBIC_CLASSES,
//   CAFETERIA,
//   CHANGING_ROOMS,
//   CROSS_FIT,
//   DISABLED_ACCESS,
//   PARKING,
//   PILATE_CLASSES,
//   PRIVATE_LOCKERS,
//   PRIVATE_RESTROOM,
//   PRIVATE_SHOWERS,
//   RECEPTION_LOUNGE,
//   REGULAR_GYM,
//   SAUNA_BATH,
//   STEAM_BATH,
//   TOWEL_SERVICE,
//   YOGA_CLASSES,
//   ZUMBA_CLASSES
// }
//
// final nameValues = EnumValues({
//   "Aerobic Classes": Name.AEROBIC_CLASSES,
//   "Cafeteria": Name.CAFETERIA,
//   "Changing Rooms": Name.CHANGING_ROOMS,
//   "Cross Fit": Name.CROSS_FIT,
//   "Disabled Access": Name.DISABLED_ACCESS,
//   "Parking": Name.PARKING,
//   "Pilate Classes": Name.PILATE_CLASSES,
//   "Private Lockers": Name.PRIVATE_LOCKERS,
//   "Private Restroom": Name.PRIVATE_RESTROOM,
//   "Private Showers": Name.PRIVATE_SHOWERS,
//   "Reception Lounge": Name.RECEPTION_LOUNGE,
//   "Regular Gym": Name.REGULAR_GYM,
//   "Sauna Bath": Name.SAUNA_BATH,
//   "Steam Bath": Name.STEAM_BATH,
//   "Towel Service": Name.TOWEL_SERVICE,
//   "Yoga Classes": Name.YOGA_CLASSES,
//   "Zumba Classes": Name.ZUMBA_CLASSES
// });
//
// class CategoryListData {
//   final int? pricingId;
//   final CategoryName? categoryName;
//   final int? categoryId;
//   final List<Price>? price;
//
//   CategoryListData({
//     this.pricingId,
//     this.categoryName,
//     this.categoryId,
//     this.price,
//   });
//
//   CategoryListData copyWith({
//     int? pricingId,
//     CategoryName? categoryName,
//     int? categoryId,
//     List<Price>? price,
//   }) =>
//       CategoryListData(
//         pricingId: pricingId ?? this.pricingId,
//         categoryName: categoryName ?? this.categoryName,
//         categoryId: categoryId ?? this.categoryId,
//         price: price ?? this.price,
//       );
//
//   factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
//     pricingId: json["pricing_id"],
//     categoryName: categoryNameValues.map[json["category_name"]]!,
//     categoryId: json["category_id"],
//     price: json["price"] == null ? [] : List<Price>.from(json["price"]!.map((x) => Price.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pricing_id": pricingId,
//     "category_name": categoryNameValues.reverse[categoryName],
//     "category_id": categoryId,
//     "price": price == null ? [] : List<dynamic>.from(price!.map((x) => x.toJson())),
//   };
// }
//
// enum CategoryName {
//   AEROBIC_EXERCISE,
//   BOXING,
//   CARDIO,
//   CROSS_FIT,
//   DANCE,
//   HYPERTROPHY,
//   JIU_JITSU,
//   KARATE_TRAINING,
//   KICKBOXING,
//   MIXED_MARTIAL_ARTS_MMA,
//   MUAY_THAI,
//   PAIN_MANAGEMENT,
//   PILATE,
//   POWERLIFTING,
//   REGULAR_GYM_EXERCISE,
//   SELF_DEFENCE_CLASS,
//   SOUND_HEALING_THERAPY,
//   STRENGTHENING,
//   STRENGTH_TRAINING,
//   STRESS_MANAGEMENT,
//   STRETCHING,
//   SWIMMING,
//   WEIGHT_TRAINING,
//   YOGA,
//   ZUMBA
// }
//
// final categoryNameValues = EnumValues({
//   "Aerobic exercise": CategoryName.AEROBIC_EXERCISE,
//   "Boxing": CategoryName.BOXING,
//   "Cardio": CategoryName.CARDIO,
//   "CrossFit": CategoryName.CROSS_FIT,
//   "Dance": CategoryName.DANCE,
//   "Hypertrophy": CategoryName.HYPERTROPHY,
//   "jiu-jitsu": CategoryName.JIU_JITSU,
//   "Karate Training": CategoryName.KARATE_TRAINING,
//   "Kickboxing": CategoryName.KICKBOXING,
//   "Mixed Martial Arts (MMA)": CategoryName.MIXED_MARTIAL_ARTS_MMA,
//   "Muay Thai": CategoryName.MUAY_THAI,
//   "Pain Management": CategoryName.PAIN_MANAGEMENT,
//   "Pilate": CategoryName.PILATE,
//   "Powerlifting": CategoryName.POWERLIFTING,
//   "Regular Gym Exercise": CategoryName.REGULAR_GYM_EXERCISE,
//   "Self Defence Class": CategoryName.SELF_DEFENCE_CLASS,
//   "Sound Healing Therapy": CategoryName.SOUND_HEALING_THERAPY,
//   "Strengthening": CategoryName.STRENGTHENING,
//   "Strength training": CategoryName.STRENGTH_TRAINING,
//   "Stress Management": CategoryName.STRESS_MANAGEMENT,
//   "Stretching": CategoryName.STRETCHING,
//   "Swimming": CategoryName.SWIMMING,
//   "Weight Training": CategoryName.WEIGHT_TRAINING,
//   "Yoga": CategoryName.YOGA,
//   "Zumba": CategoryName.ZUMBA
// });
//
// class Price {
//   final int? hour;
//   final int? rate;
//
//   Price({
//     this.hour,
//     this.rate,
//   });
//
//   Price copyWith({
//     int? hour,
//     int? rate,
//   }) =>
//       Price(
//         hour: hour ?? this.hour,
//         rate: rate ?? this.rate,
//       );
//
//   factory Price.fromJson(Map<String, dynamic> json) => Price(
//     hour: json["hour"],
//     rate: json["rate"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "hour": hour,
//     "rate": rate,
//   };
// }
//
// enum Distance {
//   THE_0_KM
// }
//
// final distanceValues = EnumValues({
//   "0 km": Distance.THE_0_KM
// });
//
// enum Rating {
//   THE_050_REVIEW
// }
//
// final ratingValues = EnumValues({
//   "0/5 (0 Review)": Rating.THE_050_REVIEW
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
