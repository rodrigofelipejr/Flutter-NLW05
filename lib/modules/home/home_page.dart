import 'package:devquiz/core/core.dart';
import 'package:devquiz/modules/home/home_controller.dart';
import 'package:devquiz/modules/home/home_state.dart';
import 'package:devquiz/modules/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/modules/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/modules/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.start();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.loading)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );

    if (controller.state == HomeState.success)
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 44.0,
              margin: const EdgeInsets.only(top: 24.0),
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LevelButtonWidget(label: "Fácil"),
                      SizedBox(width: 5.0),
                      LevelButtonWidget(label: "Médio"),
                      SizedBox(width: 5.0),
                      LevelButtonWidget(label: "Difícil"),
                      SizedBox(width: 5.0),
                      LevelButtonWidget(label: "Perito"),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: controller.quizzes?.length,
                padding: const EdgeInsets.fromLTRB(19.0, 22.0, 19.0, 0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 192.0,
                  mainAxisExtent: 192.0,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (context, index) {
                  return QuizCardWidget(
                    quiz: controller.quizzes![index],
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      );

    return Container();
  }
}
