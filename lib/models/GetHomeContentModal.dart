class GetHomeContentModal {
  List<Articles> articles;
  List<Audios> audios;
  String mediaUrl;
  Meta meta;
  List<Recommended> recommended;
  Urls urls;
  List<Videos> videos;

  GetHomeContentModal(
      {this.articles,
        this.audios,
        this.mediaUrl,
        this.meta,
        this.recommended,
        this.urls,
        this.videos});

  GetHomeContentModal.fromJson(Map<String, dynamic> json) {
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
    if (json['audios'] != null) {
      audios = new List<Audios>();
      json['audios'].forEach((v) {
        audios.add(new Audios.fromJson(v));
      });
    }
    mediaUrl = json['media_url'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['recommended'] != null) {
      recommended = new List<Recommended>();
      json['recommended'].forEach((v) {
        recommended.add(new Recommended.fromJson(v));
      });
    }
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    if (json['videos'] != null) {
      videos = new List<Videos>();
      json['videos'].forEach((v) {
        videos.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    if (this.audios != null) {
      data['audios'] = this.audios.map((v) => v.toJson()).toList();
    }
    data['media_url'] = this.mediaUrl;
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.recommended != null) {
      data['recommended'] = this.recommended.map((v) => v.toJson()).toList();
    }
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    if (this.videos != null) {
      data['videos'] = this.videos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
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

  Articles(
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

  Articles.fromJson(Map<String, dynamic> json) {
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

class Urls {
  String about;
  String faq;

  Urls({this.about, this.faq});

  Urls.fromJson(Map<String, dynamic> json) {
    about = json['about'];
    faq = json['faq'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['about'] = this.about;
    data['faq'] = this.faq;
    return data;
  }
}


class Videos {
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

  Videos(
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

  Videos.fromJson(Map<String, dynamic> json) {
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

class Recommended {
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

  Recommended(
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

  Recommended.fromJson(Map<String, dynamic> json) {
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

class Audios {
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

  Audios(
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

  Audios.fromJson(Map<String, dynamic> json) {
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