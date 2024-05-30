import 'package:flutter/material.dart';

class AdaptScreenDimensions extends StatelessWidget {
  const AdaptScreenDimensions({
    required this.child,
    this.paddingHorizontal = 20.0,
    this.paddingVertical = 0,
    this.scrollDirection = Axis.vertical,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double paddingHorizontal;
  final double paddingVertical;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: scrollDirection,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              maxWidth: constraints.maxWidth,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal,
                vertical: paddingVertical,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
