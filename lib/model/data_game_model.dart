class Object {
  Object({
    this.content,
    this.id,
    this.question,
  });

  String content;
  String id;
  Question question;

  factory Object.fromJson(Map<String, dynamic> json) => Object(
        content: json["content"],
        id: json["id"],
        question: Question.fromJson(json["question"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "id": id,
        "question": question.toJson(),
      };
}

class Question {
  Question({
    this.content,
    this.responseType,
    this.options,
  });

  String content;
  int responseType;
  String options;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        content: json["content"],
        responseType: json["responseType"],
        options: json["options"] == null ? null : json["options"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "responseType": responseType,
        "options": options == null ? null : options,
      };
}
