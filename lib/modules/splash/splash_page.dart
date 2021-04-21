import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                AppImages.interrogation,
                fit: BoxFit.cover,
              ),
              SvgPicture.asset(
                AppImages.logo,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
