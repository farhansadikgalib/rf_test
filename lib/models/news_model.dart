// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  String? status;
  int? totalResults;
  List<Result>? results;
  String? nextPage;

  NewsModel({
    this.status,
    this.totalResults,
    this.results,
    this.nextPage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    status: json["status"],
    totalResults: json["totalResults"],
    results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    nextPage: json["nextPage"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    "nextPage": nextPage,
  };
}

class Result {
  String? articleId;
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String? description;
  String? content;
  DateTime? pubDate;
  String? imageUrl;
  String? sourceId;
  int? sourcePriority;
  List<Country>? country;
  List<Category>? category;
  Language? language;

  Result({
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourcePriority,
    this.country,
    this.category,
    this.language,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    articleId: json["article_id"],
    title: json["title"],
    link: json["link"],
    keywords: json["keywords"] == null ? [] : List<String>.from(json["keywords"]!.map((x) => x)),
    creator: json["creator"] == null ? [] : List<String>.from(json["creator"]!.map((x) => x)),
    videoUrl: json["video_url"],
    description: json["description"],
    content: json["content"],
    pubDate: json["pubDate"] == null ? null : DateTime.parse(json["pubDate"]),
    imageUrl: json["image_url"],
    sourceId: json["source_id"],
    sourcePriority: json["source_priority"],
    country: json["country"] == null ? [] : List<Country>.from(json["country"]!.map((x) => countryValues.map[x]!)),
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => categoryValues.map[x]!)),
    language: languageValues.map[json["language"]]!,
  );

  Map<String, dynamic> toJson() => {
    "article_id": articleId,
    "title": title,
    "link": link,
    "keywords": keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
    "creator": creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
    "video_url": videoUrl,
    "description": description,
    "content": content,
    "pubDate": pubDate?.toIso8601String(),
    "image_url": imageUrl,
    "source_id": sourceId,
    "source_priority": sourcePriority,
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => countryValues.reverse[x])),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => categoryValues.reverse[x])),
    "language": languageValues.reverse[language],
  };
}

enum Category {
  BUSINESS,
  SPORTS,
  TOP
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "sports": Category.SPORTS,
  "top": Category.TOP
});

enum Country {
  BANGLADESH,
  INDIA
}

final countryValues = EnumValues({
  "bangladesh": Country.BANGLADESH,
  "india": Country.INDIA
});

enum Language {
  BENGALI
}

final languageValues = EnumValues({
  "bengali": Language.BENGALI
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
