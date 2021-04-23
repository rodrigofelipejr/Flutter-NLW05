import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/quiz/quiz_models.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({Key? key, required this.quiz, required this.onTap}) : super(key: key);

  String get title => quiz.title;
  int get questionsAnswered => quiz.questionsAnswered;
  int get totalQuestions => quiz.questions.length;
  double get percentage => quiz.questionsAnswered / quiz.questions.length;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _width = _size.width * 0.4;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _width,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: AppColors.border, width: 2.0)),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              child: SvgPicture.asset(
                AppImages.data,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            Row(
              children: [
                Text(
                  "$questionsAnswered de $totalQuestions",
                  style: AppTextStyles.body11,
                ),
                SizedBox(width: 21.0),
                Expanded(child: LinearProgressIndicatorWidget(value: percentage)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
