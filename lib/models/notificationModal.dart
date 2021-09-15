class NotificationModal {
  Meta meta;
  String noPages;
  List<Notifications> notifications;
  String notificationsCount;

  NotificationModal(
      {this.meta, this.noPages, this.notifications, this.notificationsCount});

  NotificationModal.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    noPages = json['no_pages'];
    if (json['notifications'] != null) {
      notifications = new List<Notifications>();
      json['notifications'].forEach((v) {
        notifications.add(new Notifications.fromJson(v));
      });
    }
    notificationsCount = json['notifications_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['no_pages'] = this.noPages;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications.map((v) => v.toJson()).toList();
    }
    data['notifications_count'] = this.notificationsCount;
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

class Notifications {
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

  Notifications(
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

  Notifications.fromJson(Map<String, dynamic> json) {
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