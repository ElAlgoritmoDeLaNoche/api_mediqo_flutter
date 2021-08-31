// To parse this JSON data, do
//
//     final selectGame = selectGameFromJson(jsonString);

import 'dart:convert';

SelectGame selectGameFromJson(String str) =>
    SelectGame.fromJson(json.decode(str));

String selectGameToJson(SelectGame data) => json.encode(data.toJson());

class SelectGame {
  SelectGame({
    this.id,
    this.message,
    this.data,
  });

  String id;
  String message;
  List<Datum> data;

  factory SelectGame.fromJson(Map<String, dynamic> json) => SelectGame(
        id: json["id"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.content,
  });

  String id;
  String content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
      };
}
