import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/models/answers/answers_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswersModel answer;
  final bool isSelected;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColorRight => answer.isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight => answer.isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(answer.isRight),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.fromBorderSide(
            BorderSide(
              color: isSelected ? _selectedBorderCardRight : AppColors.border,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                answer.title,
                style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.0),
                color: isSelected ? _selectedColorRight : AppColors.white,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  ),
                ),
              ),
              height: 24.0,
              width: 24.0,
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      size: 16.0,
                      color: AppColors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
