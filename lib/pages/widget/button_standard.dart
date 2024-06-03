import 'package:coodesh/colors.dart';
import 'package:flutter/material.dart';

class ButtonStandard extends StatelessWidget {
  const ButtonStandard({
    required this.onPressed,
    required this.title,
    this.isGradient = true,
    this.isEnable = true,
    super.key,
  });

  final void Function()? onPressed;
  final String title;
  final bool isGradient;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colorDecoratedBox(),
        gradient: isGradient
            ? const LinearGradient(
                colors: [
                  CoodeshColor.appPrimarySwatch,
                  CoodeshColor.defaultRedColor,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: ElevatedButton(
        onPressed: isEnable ? () => onPressed!() : () {},
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

  Color? colorDecoratedBox() {
    final color = isEnable ? Colors.black : Colors.black54;
    return isGradient ? null : color;
  }
}
