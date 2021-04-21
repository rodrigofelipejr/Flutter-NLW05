import 'dart:convert';

import 'package:devquiz/shared/models/question/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse =>
      {"Fácil": Level.facil, "Médio": Level.medio, "Difícil": Level.dificil, "Perito": Level.perito}[this]!;
}

extension LevelExt on Level {
  String get parse =>
      {Level.facil: "Fácil", Level.medio: "Médio", Level.dificil: "Difícil", Level.perito: "Perito"}[this]!;
}

class QuizModel {
  final String title;
  final List<Question> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  }) : assert(
            questions.length >= questionsAnswered,
            "O total questões respondidas ($questionsAnswered) não pode ser maior que o total da lista de " +
                "questões (${questions.length}).");

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions?.map((x) => x.toMap())?.toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        title: map['title'],
        questions: List<Question>.from(map['questions']?.map((x) => Question.fromMap(x))),
        questionsAnswered: map['questionsAnswered'],
        image: map['image'],
        level: map['level'].toString().parse);
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
