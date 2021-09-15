class GetTherapistEventModal {
  Meta meta;
  List<PastEvents> pastEvents;
  List<UpcomingEvents> upcomingEvents;

  GetTherapistEventModal({this.meta, this.pastEvents, this.upcomingEvents});

  GetTherapistEventModal.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['past_events'] != null) {
      pastEvents = new List<PastEvents>();
      json['past_events'].forEach((v) {
        pastEvents.add(new PastEvents.fromJson(v));
      });
    }
    if (json['upcoming_events'] != null) {
      upcomingEvents = new List<UpcomingEvents>();
      json['upcoming_events'].forEach((v) {
        upcomingEvents.add(new UpcomingEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.pastEvents != null) {
      data['past_events'] = this.pastEvents.map((v) => v.toJson()).toList();
    }
    if (this.upcomingEvents != null) {
      data['upcoming_events'] =
          this.upcomingEvents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  String message;
  String messageType;
  String status;

  Meta({this.message, this.messageType, this.status});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    messageType = json['message_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['message_type'] = this.messageType;
    data['status'] = this.status;
    return data;
  }
}

class PastEvents {
  String body;
  String createdAt;
  String createdBy;
  String id;
  String modifiedAt;
  String modifiedBy;
  String notificationId;
  String notificationStatus;
  String onesignalId;
  String personId;
  String status;
  String title;

  PastEvents(
      {this.body,
        this.createdAt,
        this.createdBy,
        this.id,
        this.modifiedAt,
        this.modifiedBy,
        this.notificationId,
        this.notificationStatus,
        this.onesignalId,
        this.personId,
        this.status,
        this.title});

  PastEvents.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    id = json['id'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    notificationId = json['notification_id'];
    notificationStatus = json['notification_status'];
    onesignalId = json['onesignal_id'];
    personId = json['person_id'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['notification_id'] = this.notificationId;
    data['notification_status'] = this.notificationStatus;
    data['onesignal_id'] = this.onesignalId;
    data['person_id'] = this.personId;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}

class UpcomingEvents {
  String body;
  String createdAt;
  String createdBy;
  String id;
  String modifiedAt;
  String modifiedBy;
  String notificationId;
  String notificationStatus;
  String onesignalId;
  String personId;
  String status;
  String title;

  UpcomingEvents(
      {this.body,
        this.createdAt,
        this.createdBy,
        this.id,
        this.modifiedAt,
        this.modifiedBy,
        this.notificationId,
        this.notificationStatus,
        this.onesignalId,
        this.personId,
        this.status,
        this.title});

  UpcomingEvents.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    id = json['id'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    notificationId = json['notification_id'];
    notificationStatus = json['notification_status'];
    onesignalId = json['onesignal_id'];
    personId = json['person_id'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['notification_id'] = this.notificationId;
    data['notification_status'] = this.notificationStatus;
    data['onesignal_id'] = this.onesignalId;
    data['person_id'] = this.personId;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}