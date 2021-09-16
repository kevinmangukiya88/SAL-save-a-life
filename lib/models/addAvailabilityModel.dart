// To parse this JSON data, do
//
//     final addAvailabilityResponseModel = addAvailabilityResponseModelFromJson(jsonString);

import 'dart:convert';

AddAvailabilityResponseModel addAvailabilityResponseModelFromJson(String str) =>
    AddAvailabilityResponseModel.fromJson(json.decode(str));

String addAvailabilityResponseModelToJson(AddAvailabilityResponseModel data) =>
    json.encode(data.toJson());

class AddAvailabilityResponseModel {
  AddAvailabilityResponseModel({
    this.meta,
  });

  Meta meta;

  factory AddAvailabilityResponseModel.fromJson(Map<String, dynamic> json) =>
      AddAvailabilityResponseModel(
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
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
