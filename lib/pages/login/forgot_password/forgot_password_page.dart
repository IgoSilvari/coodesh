import 'dart:async';
import 'package:coodesh/helper/notification_message_erro.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/forgot_password/request_forgot_password_store.dart';
import 'package:coodesh/pages/widget/background_defaut.dart';
import 'package:coodesh/pages/widget/button_standard.dart';
import 'package:coodesh/pages/widget/overlay_loading_standard.dart';
import 'package:coodesh/pages/widget/widget_form_field_defaut.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController controllerEmail;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    controllerEmail = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final requestForgot =
        Provider.of<RequestForgotPPasswordStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Scaffold(
          body: OverlayLoadingStandard(
            isVisible: requestForgot.isExecution,
            child: BackgraundDefaut(
              title: 'Verify user',
              onPressedLeading: () => Navigator.pop(context),
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.sizeOf(context).height * 0.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: WidgetFormFieldDefaut(
                          title: 'Email',
                          hintText: 'Email',
                          controller: controllerEmail,
                          textInputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.none,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            final isValid =
                                EmailValidator.validate(value ?? '');
                            if (value?.isEmpty ?? true) {
                              return 'It is mandatory to inform the email';
                            } else if (!isValid) {
                              return 'Email provided is invalid';
                            }
                            return null;
                          },
                        ),
                      ),
                      ButtonStandard(
                        title: 'Recover Password',
                        onPressed: actionButton,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> actionButton() async {
    if (_formKey.currentState!.validate()) {
      final requestForgot =
          Provider.of<RequestForgotPPasswordStore>(context, listen: false);

      final result = await requestForgot.verificEmailExist(
        email: controllerEmail.text.trim(),
      );

      if (result == StatusLoad.success) {
        if (!context.mounted) return;
        Navigator.of(context).pushReplacementNamed(
          AppRouter.recoveryInstructionsPage,
          arguments: controllerEmail.text.trim(),
        );
      } else {
        if (!context.mounted) return;
        NotificationMessageErro.message(
          statusLoad: result,
          text: 'Usuário não encontrado',
          context: context,
        );
      }
    }
  }
}
