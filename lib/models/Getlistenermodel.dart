class GetListenerDetailModal {
  String accessToken;
  String mediaUrl;
  Meta meta;
  String refreshToken;
  Listener listener;

  GetListenerDetailModal(
      {this.accessToken,
        this.mediaUrl,
        this.meta,
        this.refreshToken,
        this.listener});

  GetListenerDetailModal.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    refreshToken = json['refresh_token'];
    listener = json['listener'] != null
        ? new Listener.fromJson(json['listener'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    data['refresh_token'] = this.refreshToken;
    if (this.listener != null) {
      data['listener'] = this.listener.toJson();
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

class Listener {
  String aadhar;
  String about;
  String averageRating;
  String bankAccountNo;
  String bankAccountType;
  String bankName;
  String branchName;
  String certificate;
  String createdAt;
  String createdBy;
  String deviceId;
  String education;
  String email;
  String experience;
  String firstName;
  String gender;
  String id;
  String ifsc;
  String lastLoginTime;
  String lastName;
  String linkedin;
  String modifiedAt;
  String modifiedBy;
  String pan;
  String payeeName;
  String payoutPercentage;
  String phone;
  String photo;
  String price;
  String price3;
  String price5;
  String resume;
  String slotType;
  String status;
  String therapistId;
  String timezone;
  String totalRating;

  Listener(
      {this.aadhar,
        this.about,
        this.averageRating,
        this.bankAccountNo,
        this.bankAccountType,
        this.bankName,
        this.branchName,
        this.certificate,
        this.createdAt,
        this.createdBy,
        this.deviceId,
        this.education,
        this.email,
        this.experience,
        this.firstName,
        this.gender,
        this.id,
        this.ifsc,
        this.lastLoginTime,
        this.lastName,
        this.linkedin,
        this.modifiedAt,
        this.modifiedBy,
        this.pan,
        this.payeeName,
        this.payoutPercentage,
        this.phone,
        this.photo,
        this.price,
        this.price3,
        this.price5,
        this.resume,
        this.slotType,
        this.status,
        this.therapistId,
        this.timezone,
        this.totalRating});

  Listener.fromJson(Map<String, dynamic> json) {
    aadhar = json['aadhar'];
    about = json['about'];
    averageRating = json['average_rating'];
    bankAccountNo = json['bank_account_no'];
    bankAccountType = json['bank_account_type'];
    bankName = json['bank_name'];
    branchName = json['branch_name'];
    certificate = json['certificate'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    deviceId = json['device_id'];
    education = json['education'];
    email = json['email'];
    experience = json['experience'];
    firstName = json['first_name'];
    gender = json['gender'];
    id = json['id'];
    ifsc = json['ifsc'];
    lastLoginTime = json['last_login_time'];
    lastName = json['last_name'];
    linkedin = json['linkedin'];
    modifiedAt = json['modified_at'];
    modifiedBy = json['modified_by'];
    pan = json['pan'];
    payeeName = json['payee_name'];
    payoutPercentage = json['payout_percentage'];
    phone = json['phone'];
    photo = json['photo'];
    price = json['price'];
    price3 = json['price_3'];
    price5 = json['price_5'];
    resume = json['resume'];
    slotType = json['slot_type'];
    status = json['status'];
    therapistId = json['therapist_id'];
    timezone = json['timezone'];
    totalRating = json['total_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aadhar'] = this.aadhar;
    data['about'] = this.about;
    data['average_rating'] = this.averageRating;
    data['bank_account_no'] = this.bankAccountNo;
    data['bank_account_type'] = this.bankAccountType;
    data['bank_name'] = this.bankName;
    data['branch_name'] = this.branchName;
    data['certificate'] = this.certificate;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['device_id'] = this.deviceId;
    data['education'] = this.education;
    data['email'] = this.email;
    data['experience'] = this.experience;
    data['first_name'] = this.firstName;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['ifsc'] = this.ifsc;
    data['last_login_time'] = this.lastLoginTime;
    data['last_name'] = this.lastName;
    data['linkedin'] = this.linkedin;
    data['modified_at'] = this.modifiedAt;
    data['modified_by'] = this.modifiedBy;
    data['pan'] = this.pan;
    data['payee_name'] = this.payeeName;
    data['payout_percentage'] = this.payoutPercentage;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['price_3'] = this.price3;
    data['price_5'] = this.price5;
    data['resume'] = this.resume;
    data['slot_type'] = this.slotType;
    data['status'] = this.status;
    data['therapist_id'] = this.therapistId;
    data['timezone'] = this.timezone;
    data['total_rating'] = this.totalRating;
    return data;
  }
}