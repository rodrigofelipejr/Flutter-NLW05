import 'package:devquiz/core/core.dart';
import 'package:devquiz/modules/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/shared/models/answers/answers_model.dart';
import 'package:devquiz/shared/models/question/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;
  AnswersModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 16.0),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: selectedIndex == i,
              onTap: () {
                selectedIndex = i;
                setState(() {});
              },
            ),
        ],
      ),
    );
  }
}
