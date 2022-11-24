// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<WatchList> WatchListFromJson(String str) =>
    List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String WatchListToJson(List<WatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
  WatchList(
      {required this.watched,
        required this.title,
        required this.rating,
        required this.release_date,
        required this.review});

  bool watched;
  String title;
  int rating;
  String release_date;
  String review;

  void changeStatus() {
    this.watched = !this.watched;
  }

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
    watched: json["fields"]["watched"],
    title: json["fields"]["title"],
    rating: json["fields"]["rating"],
    release_date: json["fields"]["release_date"],
    review: json["fields"]["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating" : rating,
    "release_date" : release_date,
    "review" : review,
  };
}