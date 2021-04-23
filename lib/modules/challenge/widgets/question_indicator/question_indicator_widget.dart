import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int numberQuestion;
  final int totalQuestions;

  const QuestionIndicatorWidget({
    Key? key,
    required this.numberQuestion,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    "Questão $numberQuestion de $totalQuestions",
                    style: AppTextStyles.body15,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicatorWidget(value: numberQuestion / totalQuestions),
          ),
        ],
      ),
    );
  }
}
