import 'package:devquiz/core/core.dart';
import 'package:devquiz/modules/home/widgets/chart/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      padding: const EdgeInsets.all(24.0),
      height: 136,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border, width: 1.0),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ChartWidget(),
          ),
          SizedBox(width: 24.0),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Vamos começar",
                  style: AppTextStyles.heading,
                ),
                Text(
                  "Complete os desafios e avance em conhecimento",
                  style: AppTextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
