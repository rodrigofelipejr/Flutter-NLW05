import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

enum ButtonType { green, white, purple }

class ButtonWidget extends StatelessWidget {
  final String label;
  final ButtonType type;
  final VoidCallback? onPressed;

  ButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.type = ButtonType.green,
  }) : super(key: key);

  final config = {
    ButtonType.green: {
      "backgroundColor": AppColors.darkGreen,
      "textColor": AppColors.white,
      "borderColor": AppColors.darkGreen,
    },
    ButtonType.white: {
      "backgroundColor": AppColors.white,
      "textColor": AppColors.grey,
      "borderColor": AppColors.border,
    },
    ButtonType.purple: {
      "backgroundColor": AppColors.purple,
      "textColor": AppColors.white,
      "borderColor": AppColors.purple,
    },
  };

  Color get backgroundColor => config[type]!['backgroundColor']!;
  Color get textColor => config[type]!['textColor']!;
  Color get borderColor => config[type]!['borderColor']!;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        child: Text(label),
        style: TextButton.styleFrom(
          primary: textColor,
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          elevation: 0,
          side: BorderSide(color: borderColor),
          textStyle: AppTextStyles.bodyWhite15Semi,
          backgroundColor: backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
