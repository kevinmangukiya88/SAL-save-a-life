class GetAvailableAssessmentModal {
  List<AssessmentsList> assessments;
  String mediaUrl;
  Meta meta;

  GetAvailableAssessmentModal({this.assessments, this.mediaUrl, this.meta});

  GetAvailableAssessmentModal.fromJson(Map<String, dynamic> json) {
    if (json['assessments'] != null) {
      assessments = new List<AssessmentsList>();
      json['assessments'].forEach((v) {
        assessments.add(new AssessmentsList.fromJson(v));
      });
    }
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assessments != null) {
      data['assessments'] = this.assessments.map((v) => v.toJson()).toList();
    }
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    return data;
  }
}

class AssessmentsList {
  String assessmentId;
  String createdAt;
  String createdBy;
  String id;
  String instruction;
  String modifiedAt;
  String modifiedBy;
  String order;
  String photo;
  String status;
  String subtitle;
  String title;
  String type;

  AssessmentsList(
      {this.assessmentId,
        this.createdAt,
        this.createdBy,
        this.id,
        this.instruction,
        this.modifiedAt,
        this.modifiedBy,
        this.order,
        this.photo,
        this.status,
        this.subtitle,
        this.title,
        this.type});

  AssessmentsList.fromJson(Map<String, dynamic> json) {
    assessmentId = json['assessment_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    id = json['id'];
    instruction = json['instruction'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    order = json['order'];
    photo = json['photo'];
    status = json['status'];
    subtitle = json['subtitle'];
    title = json['title'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['assessment_id'] = this.assessmentId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['id'] = this.id;
    data['instruction'] = this.instruction;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['order'] = this.order;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['type'] = this.type;
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