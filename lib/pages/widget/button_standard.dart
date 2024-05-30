import 'package:coodesh/colors.dart';
import 'package:flutter/material.dart';

class ButtonStandard extends StatelessWidget {
  const ButtonStandard(
      {required this.onPressed, required this.title, super.key});

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            CoodeshColor.appPrimarySwatch,
            CoodeshColor.defaultRedColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: () => onPressed!(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
