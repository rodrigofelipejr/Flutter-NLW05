import 'package:flutter/material.dart';

class ChallengerController {
  final currentQuestionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;
}
