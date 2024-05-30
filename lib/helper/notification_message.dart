import 'package:flutter/material.dart';

class NotificationMessage {
  static void message({
    required BuildContext context,
    String highlightedWord = '',
    String firstText = '',
    String secondText = '',
    Color colorCard = Colors.green,
    Color colorText = Colors.white,
    double heightCard = 35,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: colorCard,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.sizeOf(context).height * 0.7,
          left: 30,
          right: 30,
        ),
        content: SizedBox(
          height: heightCard,
          child: Center(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: firstText,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: colorText,
                    ),
                children: [
                  TextSpan(
                    text: ' $highlightedWord ',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: colorText,
                        ),
                  ),
                  TextSpan(
                    text: secondText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: colorText,
                        ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
