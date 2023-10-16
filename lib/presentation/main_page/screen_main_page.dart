import 'package:auto_route/annotations.dart';
import 'package:exercise_app/presentation/details_page/screen_details_page.dart';
import 'package:exercise_app/presentation/home_page/screen_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

@RoutePage()
class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ScreenHomePage()),
    );
  }
}