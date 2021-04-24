import 'package:flutter/material.dart';

class ChallengerController {
  final currentQuestionNotifier = ValueNotifier<int>(1);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  final _totalRightAnswersNotifier = ValueNotifier<int>(0);
  int get totalRightAnswers => _totalRightAnswersNotifier.value;
  set totalRightAnswers(int value) => _totalRightAnswersNotifier.value = value;
}
