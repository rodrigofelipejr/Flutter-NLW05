import 'package:devquiz/modules/challenge/widgets/question_indicattor/question_indicator_widget.dart';
import 'package:devquiz/modules/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: QuestionIndicatorWidget(),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    QuizWidget(title: "O que o Flutter faz em sua totalidade?"),
                  ],
                ),
              ),
              Row(
                children: [
                  ButtonWidget(
                    label: "Pular",
                    type: ButtonType.secondary,
                  ),
                  SizedBox(width: 8.0),
                  ButtonWidget(
                    label: "Confirmar",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
