// To parse this JSON data, do
//
//     final getTopicsResponseModel = getTopicsResponseModelFromJson(jsonString);

import 'dart:convert';

GetTopicsResponseModel getTopicsResponseModelFromJson(String str) => GetTopicsResponseModel.fromJson(json.decode(str));

String getTopicsResponseModelToJson(GetTopicsResponseModel data) => json.encode(data.toJson());

class GetTopicsResponseModel {
  GetTopicsResponseModel({
    this.meta,
    this.topics,
  });

  Meta meta;
  List<Topic> topics;

  factory GetTopicsResponseModel.fromJson(Map<String, dynamic> json) => GetTopicsResponseModel(
    meta: Meta.fromJson(json["meta"]),
    topics: List<Topic>.from(json["topics"].map((x) => Topic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "topics": List<dynamic>.from(topics.map((x) => x.toJson())),
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

class Topic {
  Topic({
    this.id,
    this.topic,
  });

  String id;
  String topic;

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["id"],
    topic: json["topic"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic": topic,
  };
}
