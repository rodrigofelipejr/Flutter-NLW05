import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questão 04", style: AppTextStyles.body15),
              Text("de 10", style: AppTextStyles.body15),
            ],
          ),
          SizedBox(height: 16.0),
          LinearProgressIndicatorWidget(value: 0.35),
        ],
      ),
    );
  }
}
