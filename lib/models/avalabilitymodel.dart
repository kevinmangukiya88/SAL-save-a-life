// To parse this JSON data, do
//
//     final availabiltiyModel = availabiltiyModelFromJson(jsonString);

import 'dart:convert';

AvailabiltiyModel availabiltiyModelFromJson(String str) =>
    AvailabiltiyModel.fromJson(json.decode(str));

String availabiltiyModelToJson(AvailabiltiyModel data) =>
    json.encode(data.toJson());

class AvailabiltiyModel {
  AvailabiltiyModel({
    this.availability,
    this.meta,
  });

  List<Map<String, String>> availability;
  Meta meta;

  factory AvailabiltiyModel.fromJson(Map<String, dynamic> json) =>
      AvailabiltiyModel(
        availability: List<Map<String, String>>.from(json["availability"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "availability": List<dynamic>.from(availability.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    this.message,
    this.messageType,
    this.status,
  });

  String message;
  String messageType;
  String status;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json["message"],
        messageType: json["message_type"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "message_type": messageType,
        "status": status,
      };
}
