import 'package:coodesh/helper/status_loading.dart';
import 'package:flutter/material.dart';

class NotificationMessageErro {
  static void message({
    required StatusLoad? statusLoad,
    required BuildContext context,
    String? text,
    Color colorCard = Colors.green,
    Color colorText = Colors.white,
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
          height: 35,
          child: Center(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: _verificFail(statusLoad: statusLoad, text: text),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 13,
                      color: colorText,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String _verificFail({StatusLoad? statusLoad, String? text}) {
    switch (statusLoad) {
      case StatusLoad.authenticationFailure:
        return text ?? 'E-mail e/ou senha incorreta';
      case StatusLoad.failed:
        return 'Ocorreu um erro';
      case StatusLoad.reportedDataError:
        return text ?? '';
      default:
    }
    return '';
  }
}
