class GetTherapistContentModal {
  String mediaUrl;
  Meta meta;
  List<Training> training;

  GetTherapistContentModal({this.mediaUrl, this.meta, this.training});

  GetTherapistContentModal.fromJson(Map<String, dynamic> json) {
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['training'] != null) {
      training = new List<Training>();
      json['training'].forEach((v) {
        training.add(new Training.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.training != null) {
      data['training'] = this.training.map((v) => v.toJson()).toList();
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

class Training {
  String categoryId;
  String content;
  String contentId;
  String counsellorId;
  String createdAt;
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

  Training(
      {this.categoryId,
        this.content,
        this.contentId,
        this.counsellorId,
        this.createdAt,
        this.createdBy,
        this.description,
        this.id,
        this.modifiedAt,
        this.modifiedBy,
        this.moodId,
        this.photo,
        this.redirection,
        this.status,
        this.title,
        this.training,
        this.type});

  Training.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    content = json['content'];
    contentId = json['content_id'];
    counsellorId = json['counsellor_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    description = json['description'];
    id = json['id'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    moodId = json['mood_id'];
    photo = json['photo'];
    redirection = json['redirection'];
    status = json['status'];
    title = json['title'];
    training = json['training'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['content'] = this.content;
    data['content_id'] = this.contentId;
    data['counsellor_id'] = this.counsellorId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['description'] = this.description;
    data['id'] = this.id;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['mood_id'] = this.moodId;
    data['photo'] = this.photo;
    data['redirection'] = this.redirection;
    data['status'] = this.status;
    data['title'] = this.title;
    data['training'] = this.training;
    data['type'] = this.type;
    return data;
  }
}