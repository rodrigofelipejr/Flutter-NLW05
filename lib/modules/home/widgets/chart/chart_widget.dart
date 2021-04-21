import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      width: 88,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 88,
            width: 88,
            child: CircularProgressIndicator(
              strokeWidth: 10.0,
              backgroundColor: AppColors.chartSecondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
              value: 0.75,
            ),
          ),
          Text(
            "75%",
            style: AppTextStyles.heading,
          )
        ],
      ),
    );
  }
}
