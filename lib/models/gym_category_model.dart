// To parse this JSON data, do
//
//     final gymCategoryModel = gymCategoryModelFromJson(jsonString);

import 'dart:convert';

GymCategoryModel gymCategoryModelFromJson(String str) => GymCategoryModel.fromJson(json.decode(str));

String gymCategoryModelToJson(GymCategoryModel data) => json.encode(data.toJson());

class GymCategoryModel {
  final bool? status;
  final String? message;
  final String? messageIos;
  final List<CategoryData>? data;

  GymCategoryModel({
    this.status,
    this.message,
    this.messageIos,
    this.data,
  });

  GymCategoryModel copyWith({
    bool? status,
    String? message,
    String? messageIos,
    List<CategoryData>? data,
  }) =>
      GymCategoryModel(
        status: status ?? this.status,
        message: message ?? this.message,
        messageIos: messageIos ?? this.messageIos,
        data: data ?? this.data,
      );

  factory GymCategoryModel.fromJson(Map<String, dynamic> json) => GymCategoryModel(
    status: json["status"],
    message: json["message"],
    messageIos: json["message_ios"],
    data: json["data"] == null ? [] : List<CategoryData>.from(json["data"]!.map((x) => CategoryData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "message_ios": messageIos,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CategoryData {
  final int? id;
  final String? name;
  final String? icon;

  CategoryData({
    this.id,
    this.name,
    this.icon,
  });

  CategoryData copyWith({
    int? id,
    String? name,
    String? icon,
  }) =>
      CategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
      );

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
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
