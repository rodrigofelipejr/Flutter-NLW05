import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/button/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String label;
  final int totalRightAnswers;
  final int totalQuestions;

  const ResultPage({
    Key? key,
    required this.label,
    required this.totalRightAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                ),
                child: SvgPicture.asset(
                  AppImages.trophy,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    "Parabéns!",
                    style: AppTextStyles.heading30,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Você concluiu",
                    style: AppTextStyles.body15,
                  ),
                  Text(
                    label,
                    style: AppTextStyles.body15Bold,
                  ),
                  Text(
                    "com $totalRightAnswers de $totalQuestions acertos",
                    style: AppTextStyles.body15,
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.6),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ButtonWidget(
                          label: "Compartilhar",
                          type: ButtonType.purple,
                          onPressed: () => Share.share("teste"),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        ButtonWidget(
                          label: "Voltar ao início",
                          type: ButtonType.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
