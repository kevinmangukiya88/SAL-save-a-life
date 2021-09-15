// To parse this JSON data, do
//
//     final getCounsellor = getCounsellorFromJson(jsonString);

import 'dart:convert';

Appointmentmodel getCounsellorFromJson(String str) => Appointmentmodel.fromJson(json.decode(str));

String getCounsellorToJson(Appointmentmodel data) => json.encode(data.toJson());

class Appointmentmodel {
  Appointmentmodel({
    this.appointments,
    this.clients,
    this.mediaUrl,
    this.meta,
  });

  List<Appointment> appointments;
  Clients clients;
  String mediaUrl;
  Meta meta;

  factory Appointmentmodel.fromJson(Map<String, dynamic> json) => Appointmentmodel(
    appointments: List<Appointment>.from(json["appointments"].map((x) => Appointment.fromJson(x))),
    clients: Clients.fromJson(json["clients"]),
    mediaUrl: json["media_url"],
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "appointments": List<dynamic>.from(appointments.map((x) => x.toJson())),
    "clients": clients.toJson(),
    "media_url": mediaUrl,
    "meta": meta.toJson(),
  };
}

class Appointment {
  Appointment({
    this.appointmentId,
    this.cancellationReason,
    this.clientId,
    this.comment,
    this.counsellorId,
    this.createdAt,
    this.createdBy,
    this.date,
    this.id,
    this.modifiedAt,
    this.modifiedBy,
    this.orderId,
    this.rating,
    this.ratingComment,
    this.ratingTypes,
    this.status,
    this.time,
    this.timesRescheduled,
  });

  String appointmentId;
  String cancellationReason;
  String clientId;
  String comment;
  String counsellorId;
  String createdAt;
  String createdBy;
  String date;
  String id;
  String modifiedAt;
  DateTime modifiedBy;
  String orderId;
  String rating;
  String ratingComment;
  String ratingTypes;
  String status;
  String time;
  String timesRescheduled;

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    appointmentId: json["appointment_id"],
    cancellationReason: json["cancellation_reason"],
    clientId: json["client_id"],
    comment: json["comment"],
    counsellorId: json["counsellor_id"],
    createdAt: json["created_at"],
    createdBy: json["created_by"],
    date: json["date"],
    id: json["id"],
    modifiedAt: json["modified_at"],
    modifiedBy: DateTime.parse(json["modified_by"]),
    orderId: json["order_id"],
    rating: json["rating"],
    ratingComment: json["rating_comment"],
    ratingTypes: json["rating_types"],
    status: json["status"],
    time: json["time"],
    timesRescheduled: json["times_rescheduled"],
  );

  Map<String, dynamic> toJson() => {
    "appointment_id": appointmentId,
    "cancellation_reason": cancellationReason,
    "client_id": clientId,
    "comment": comment,
    "counsellor_id": counsellorId,
    "created_at": createdAt,
    "created_by": createdBy,
    "date": date,
    "id": id,
    "modified_at": modifiedAt,
    "modified_by": modifiedBy.toIso8601String(),
    "order_id": orderId,
    "rating": rating,
    "rating_comment": ratingComment,
    "rating_types": ratingTypes,
    "status": status,
    "time": time,
    "times_rescheduled": timesRescheduled,
  };
}

class Clients {
  Clients({
    this.nhj8Xnwvn4O67V,
  });

  Nhj8Xnwvn4O67V nhj8Xnwvn4O67V;

  factory Clients.fromJson(Map<String, dynamic> json) => Clients(
    nhj8Xnwvn4O67V: Nhj8Xnwvn4O67V.fromJson(json["nhj8xnwvn4o67v"]),
  );

  Map<String, dynamic> toJson() => {
    "nhj8xnwvn4o67v": nhj8Xnwvn4O67V.toJson(),
  };
}

class Nhj8Xnwvn4O67V {
  Nhj8Xnwvn4O67V({
    this.clientId,
    this.firstName,
    this.lastName,
  });

  String clientId;
  String firstName;
  String lastName;

  factory Nhj8Xnwvn4O67V.fromJson(Map<String, dynamic> json) => Nhj8Xnwvn4O67V(
    clientId: json["client_id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "client_id": clientId,
    "first_name": firstName,
    "last_name": lastName,
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
