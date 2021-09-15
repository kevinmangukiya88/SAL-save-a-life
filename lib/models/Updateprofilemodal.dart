class UpdateProfileModel {
  Meta meta;
  String therapistId;

  UpdateProfileModel({this.meta, this.therapistId});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    therapistId = json['therapist_id'] != null ?json['therapist_id'] : null ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['therapist_id'] = this.therapistId;
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