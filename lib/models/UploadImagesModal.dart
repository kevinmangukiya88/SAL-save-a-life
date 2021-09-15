class UploadImagesModal {
  String file;
  String mediaUrl;
  Meta meta;

  UploadImagesModal({this.file, this.mediaUrl, this.meta});

  UploadImagesModal.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
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