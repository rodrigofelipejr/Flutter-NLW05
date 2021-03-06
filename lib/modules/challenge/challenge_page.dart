import 'package:devquiz/modules/challenge/challenge_controller.dart';
import 'package:devquiz/modules/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/modules/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/modules/result/result_page.dart';
import 'package:devquiz/shared/models/question/question_model.dart';
import 'package:devquiz/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String quizTitle;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.quizTitle,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final ChallengerController controller = ChallengerController();
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() => setState(() {}));
  }

  bool get isLastQuestion => controller.currentQuestion == widget.questions.length;

  void nextPage() {
    if (!isLastQuestion)
      pageController.nextPage(
        duration: Duration(milliseconds: 250),
        curve: Curves.linear,
      );
  }

  void onSelected(bool value) {
    if (value) controller.totalRightAnswers++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentQuestionNotifier,
            builder: (context, index, _) => QuestionIndicatorWidget(
              numberQuestion: controller.currentQuestion,
              totalQuestions: widget.questions.length,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          controller.currentQuestion++;
        },
        children: widget.questions
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: QuizWidget(
                    question: e,
                    onSelected: onSelected,
                  ),
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              ButtonWidget(
                label: "Pular",
                onPressed: isLastQuestion ? null : () => nextPage(),
                type: ButtonType.white,
              ),
              SizedBox(width: 8.0),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifier,
                builder: (context, value, _) => ButtonWidget(
                  label: "Confirmar",
                  onPressed: value == widget.questions.length
                      ? () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                label: widget.quizTitle,
                                totalRightAnswers: controller.totalRightAnswers,
                                totalQuestions: widget.questions.length,
                              ),
                            ),
                          )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
