class GetPaymentsModal {
  Meta meta;
  String noPages;
  List<Payments> payments;
  String paymentsCount;

  GetPaymentsModal({this.meta, this.noPages, this.payments, this.paymentsCount});

  GetPaymentsModal.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    noPages = json['no_pages'];
    if (json['payments'] != null) {
      payments = new List<Payments>();
      json['payments'].forEach((v) {
        payments.add(new Payments.fromJson(v));
      });
    }
    paymentsCount = json['payments_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['no_pages'] = this.noPages;
    if (this.payments != null) {
      data['payments'] = this.payments.map((v) => v.toJson()).toList();
    }
    data['payments_count'] = this.paymentsCount;
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

class Payments {
  String amount;
  String comment;
  String counsellorId;
  String createdAt;
  String createdBy;
  String description;
  String heading;
  String id;
  String modifiedAt;
  String modifiedBy;
  String paymentId;
  String status;

  Payments(
      {this.amount,
        this.comment,
        this.counsellorId,
        this.createdAt,
        this.createdBy,
        this.description,
        this.heading,
        this.id,
        this.modifiedAt,
        this.modifiedBy,
        this.paymentId,
        this.status});

  Payments.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    comment = json['comment'];
    counsellorId = json['counsellor_id'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    description = json['description'];
    heading = json['heading'];
    id = json['id'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    paymentId = json['payment_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['comment'] = this.comment;
    data['counsellor_id'] = this.counsellorId;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['description'] = this.description;
    data['heading'] = this.heading;
    data['id'] = this.id;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['payment_id'] = this.paymentId;
    data['status'] = this.status;
    return data;
  }
}