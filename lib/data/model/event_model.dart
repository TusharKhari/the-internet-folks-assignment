
class EventsModel {
  Content? content;
  bool? status;
  String? error;
  EventsModel({this.content, this.status});
  
   EventsModel.withError(String errorMessage) {
    error = errorMessage;
  }
  EventsModel.fromJson(Map<String, dynamic> json) {
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Content {
  List<Data>? data;
  Meta? meta;

  Content({this.data, this.meta});

  Content.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? bannerImage;
  String? dateTime;
  String? organiserName;
  String? organiserIcon;
  String? venueName;
  String? venueCity;
  String? venueCountry;

  Data(
      {this.id,
      this.title,
      this.description,
      this.bannerImage,
      this.dateTime,
      this.organiserName,
      this.organiserIcon,
      this.venueName,
      this.venueCity,
      this.venueCountry});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bannerImage = json['banner_image'];
    dateTime = json['date_time'];
    organiserName = json['organiser_name'];
    organiserIcon = json['organiser_icon'];
    venueName = json['venue_name'];
    venueCity = json['venue_city'];
    venueCountry = json['venue_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['banner_image'] = bannerImage;
    data['date_time'] = dateTime;
    data['organiser_name'] = organiserName;
    data['organiser_icon'] = organiserIcon;
    data['venue_name'] = venueName;
    data['venue_city'] = venueCity;
    data['venue_country'] = venueCountry;
    return data;
  }
}

class Meta {
  int? total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
