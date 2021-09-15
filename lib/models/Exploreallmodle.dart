// To parse this JSON data, do
//
//     final exploreallModel = exploreallModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ExploreallModel exploreallModelFromJson(String str) => ExploreallModel.fromJson(json.decode(str));

String exploreallModelToJson(ExploreallModel data) => json.encode(data.toJson());

class ExploreallModel {
  ExploreallModel({
    @required this.mediaUrl,
    @required this.meta,
    @required this.training,
  });

  String mediaUrl;
  Meta meta;
  List<Training> training;

  factory ExploreallModel.fromJson(Map<String, dynamic> json) => ExploreallModel(
    mediaUrl: json["media_url"] == null ? null : json["media_url"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    training: json["training"] == null ? null : List<Training>.from(json["training"].map((x) => Training.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "media_url": mediaUrl == null ? null : mediaUrl,
    "meta": meta == null ? null : meta.toJson(),
    "training": training == null ? null : List<dynamic>.from(training.map((x) => x.toJson())),
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

class Training {
  Training({
    @required this.categoryId,
    @required this.content,
    @required this.contentId,
    @required this.counsellorId,
    @required this.createdAt,
    @required this.createdBy,
    @required this.description,
    @required this.id,
    @required this.modifiedAt,
    @required this.modifiedBy,
    @required this.moodId,
    @required this.photo,
    @required this.redirection,
    @required this.status,
    @required this.title,
    @required this.training,
    @required this.type,
  });

  String categoryId;
  String content;
  String contentId;
  String counsellorId;
  DateTime createdAt;
  String createdBy;
  String description;
  String id;
  String modifiedAt;
  String modifiedBy;
  String moodId;
  String photo;
  String redirection;
  String status;
  String title;
  String training;
  String type;

  factory Training.fromJson(Map<String, dynamic> json) => Training(
    categoryId: json["category_id"] == null ? null : json["category_id"],
    content: json["content"] == null ? null : json["content"],
    contentId: json["content_id"] == null ? null : json["content_id"],
    counsellorId: json["counsellor_id"] == null ? null : json["counsellor_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdBy: json["created_by"] == null ? null : json["created_by"],
    description: json["description"] == null ? null : json["description"],
    id: json["id"] == null ? null : json["id"],
    modifiedAt: json["modified_at"] == null ? null : json["modified_at"],
    modifiedBy: json["modified_by"] == null ? null : json["modified_by"],
    moodId: json["mood_id"] == null ? null : json["mood_id"],
    photo: json["photo"] == null ? null : json["photo"],
    redirection: json["redirection"] == null ? null : json["redirection"],
    status: json["status"] == null ? null : json["status"],
    title: json["title"] == null ? null : json["title"],
    training: json["training"] == null ? null : json["training"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId == null ? null : categoryId,
    "content": content == null ? null : content,
    "content_id": contentId == null ? null : contentId,
    "counsellor_id": counsellorId == null ? null : counsellorId,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "created_by": createdBy == null ? null : createdBy,
    "description": description == null ? null : description,
    "id": id == null ? null : id,
    "modified_at": modifiedAt == null ? null : modifiedAt,
    "modified_by": modifiedBy == null ? null : modifiedBy,
    "mood_id": moodId == null ? null : moodId,
    "photo": photo == null ? null : photo,
    "redirection": redirection == null ? null : redirection,
    "status": status == null ? null : status,
    "title": title == null ? null : title,
    "training": training == null ? null : training,
    "type": type == null ? null : type,
  };
}
