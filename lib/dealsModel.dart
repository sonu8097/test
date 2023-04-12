// To parse this JSON data, do
//
//     final dealsModel = dealsModelFromJson(jsonString);

import 'dart:convert';

DealsModel dealsModelFromJson(String str) => DealsModel.fromJson(json.decode(str));

String dealsModelToJson(DealsModel data) => json.encode(data.toJson());

class DealsModel {
  DealsModel({
    this.seoSettings,
    this.deals,
    this.event,
  });

  SeoSettings seoSettings;
  List<Deal> deals;
  Event event;

  factory DealsModel.fromJson(Map<String, dynamic> json) => DealsModel(
    seoSettings: SeoSettings.fromJson(json["seo_settings"]),
    deals: List<Deal>.from(json["deals"].map((x) => Deal.fromJson(x))),
    event: Event.fromJson(json["event"]),
  );

  Map<String, dynamic> toJson() => {
    "seo_settings": seoSettings.toJson(),
    "deals": List<dynamic>.from(deals.map((x) => x.toJson())),
    "event": event.toJson(),
  };
}

class Deal {
  Deal({
     this.id,
     this.commentsCount,
     this.createdAt,
     this.createdAtInMillis,
     this.imageMedium,
    this.store,
  });

  int id;
  int commentsCount;
  DateTime createdAt;
  int createdAtInMillis;
  String imageMedium;
  Store store;

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
    id: json["id"],
    commentsCount: json["comments_count"],
    createdAt: DateTime.parse(json["created_at"]),
    createdAtInMillis: json["created_at_in_millis"],
    imageMedium: json["image_medium"],
    store: json["store"] == null ? null : Store.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comments_count": commentsCount,
    "created_at": createdAt.toIso8601String(),
    "created_at_in_millis": createdAtInMillis,
    "image_medium": imageMedium,
    "store": store?.toJson(),
  };
}

class Store {
  Store({
     this.name,
  });

  String name;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Event {
  Event({
     this.id,
     this.imageUrl,
     this.pageUrl,
  });

  int id;
  String imageUrl;
  String pageUrl;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    imageUrl: json["image_url"],
    pageUrl: json["page_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "page_url": pageUrl,
  };
}

class SeoSettings {
  SeoSettings({
     this.seoTitle,
     this.seoDescription,
     this.webUrl,
  });

  String seoTitle;
  String seoDescription;
  String webUrl;

  factory SeoSettings.fromJson(Map<String, dynamic> json) => SeoSettings(
    seoTitle: json["seo_title"],
    seoDescription: json["seo_description"],
    webUrl: json["web_url"],
  );

  Map<String, dynamic> toJson() => {
    "seo_title": seoTitle,
    "seo_description": seoDescription,
    "web_url": webUrl,
  };
}
