import 'package:devquiz/modules/home/home_state.dart';
import 'package:devquiz/modules/home/repositories/home_repository.dart';
import 'package:devquiz/shared/models/quiz/quiz_models.dart';
import 'package:devquiz/shared/models/user/user_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final HomeRepository repository = HomeRepository();

  final stateNotifier = ValueNotifier<HomeState>(HomeState.none);
  set state(HomeState value) => stateNotifier.value = value;
  HomeState get state => stateNotifier.value;

  void start() async {
    state = HomeState.loading;
    await _getUser();
    await _getQuizzes();
    state = HomeState.success;
  }

  UserModel? user;
  Future<void> _getUser() async {
    user = await repository.getUser();
  }

  List<QuizModel>? quizzes;
  Future<void> _getQuizzes() async {
    quizzes = await repository.getQuizzes();
  }
}
