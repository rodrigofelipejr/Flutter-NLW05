import 'dart:convert';

class Answers {
  final String title;
  final bool isRight;

  Answers({
    required this.title,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) => Answers.fromMap(json.decode(source));
}
