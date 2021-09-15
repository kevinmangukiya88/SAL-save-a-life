// To parse this JSON data, do
//
//     final availabiltiy = availabiltiyFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AvailabiltiyModel availabiltiyFromJson(String str) => AvailabiltiyModel.fromJson(json.decode(str));

String availabiltiyToJson(AvailabiltiyModel data) => json.encode(data.toJson());

class AvailabiltiyModel {
    AvailabiltiyModel({
        @required this.availability,
        @required this.meta,
    });

    List<Map<String, String>> availability;
    Meta meta;

    factory AvailabiltiyModel.fromJson(Map<String, dynamic> json) => AvailabiltiyModel(
        availability: json["availability"] == null ? null : List<Map<String, String>>.from(json["availability"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "availability": availability == null ? null : List<dynamic>.from(availability.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        "meta": meta == null ? null : meta.toJson(),
    };
}

class Meta {
    Meta({
        @required this.message,
        @required this.messageType,
        @required this.status,
    });

    String message;
    String messageType;
    String status;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        message: json["message"] == null ? null : json["message"],
        messageType: json["message_type"] == null ? null : json["message_type"],
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "message_type": messageType == null ? null : messageType,
        "status": status == null ? null : status,
    };
}
