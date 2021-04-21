import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  const AnswerWidget({
    Key? key,
    required this.title,
    this.isRight = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRight => isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight => isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight => isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight => isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              title,
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
    );
  }
}
