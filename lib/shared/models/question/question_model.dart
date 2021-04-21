import 'dart:convert';

import 'package:devquiz/shared/models/answers/answers_model.dart';

class Question {
  final String title;
  final List<Answers> answers;

  Question({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      title: map['title'],
      answers: List<Answers>.from(map['answers']?.map((x) => Answers.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source));
}
