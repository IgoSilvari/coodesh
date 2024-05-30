import 'package:coodesh/pages/widget/button_standard.dart';
import 'package:flutter/material.dart';

class OverlayPatternButton extends StatelessWidget {
  const OverlayPatternButton({
    required this.title,
    required this.onPressed,
    this.paddingHorizontal = 24,
    this.paddingVertical = 0,
    this.backgroundColor = Colors.white,
    this.heightCard = 100,
    Key? key,
  }) : super(key: key);

  final String title;
  final double paddingVertical;
  final double paddingHorizontal;
  final Color backgroundColor;
  final Future<void> Function() onPressed;
  final double heightCard;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      elevation: 1,
      child: Container(
        height: heightCard,
        margin: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        child: Center(
          child: ButtonStandard(
            onPressed: onPressed,
            title: title,
          ),
        ),
      ),
    );
  }
}
