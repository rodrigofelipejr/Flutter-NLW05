import 'package:devquiz/core/core.dart';
import 'package:devquiz/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(),
        ),
      ),
    );
  }

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
