import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/linear_progress_indicator/linear_progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final double _width = _size.width * 0.4;

    return Container(
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
            child: Image.asset(
              AppImages.data,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            "Gerenciamento de Estado",
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Text(
                "3 de 10",
                style: AppTextStyles.body11,
              ),
              SizedBox(width: 21.0),
              Expanded(
                child: LinearProgressIndicatorWidget(value: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
