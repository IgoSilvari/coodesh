import 'package:coodesh/colors.dart';
import 'package:coodesh/pages/home/app_bar_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: CoodeshColor.linearGradient,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
