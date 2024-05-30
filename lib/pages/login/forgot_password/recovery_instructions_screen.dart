import 'dart:async';
import 'package:coodesh/colors.dart';
import 'package:coodesh/helper/notification_message.dart';
import 'package:coodesh/helper/notification_message_erro.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';
import 'package:coodesh/store/forgot_password/request_forgot_password_store.dart';
import 'package:coodesh/pages/widget/background_defaut.dart';
import 'package:coodesh/pages/widget/button_standard.dart';
import 'package:coodesh/pages/widget/overlay_loading_standard.dart';
import 'package:coodesh/pages/widget/widget_form_field_defaut.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RecoveryInstructionsPage extends StatefulWidget {
  const RecoveryInstructionsPage({required this.email, super.key});

  final String email;

  @override
  State<RecoveryInstructionsPage> createState() =>
      _RecoveryInstructionsPageState();
}

class _RecoveryInstructionsPageState extends State<RecoveryInstructionsPage> {
  late TextEditingController newPasswordController;
  late TextEditingController newPasswordConfirmsixController;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    newPasswordController = TextEditingController();
    newPasswordConfirmsixController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    newPasswordConfirmsixController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final requestForgot =
        Provider.of<RequestForgotPPasswordStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return OverlayLoadingStandard(
          isVisible: requestForgot.isExecution,
          child: Scaffold(
            body: BackgraundDefaut(
              title: 'Redefinir Senha',
              top: 0,
              onPressedLeading: () => Navigator.pop(context),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height * 0.8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Redefinir senha \n${widget.email}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: CoodeshColor.appPrimarySwatch,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 0),
                      child: Form(
                        key: formkey,
                        child: Card(
                          color: CoodeshColor.appPrimarySwatch,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 20,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetFormFieldDefaut(
                                  title: 'Nova Senha',
                                  controller: newPasswordController,
                                  hintText: 'Nova senha',
                                  colorTitle: Colors.white,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.text,
                                  textCapitalization: TextCapitalization.none,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'É obrigatorio informar uma senha';
                                    } else if ((value?.length ?? 0) < 6) {
                                      return 'A senha deve conter no minimo 6 caracteres ';
                                    }
                                    return null;
                                  },
                                ),
                                WidgetFormFieldDefaut(
                                  title: 'Confirmar nova senha',
                                  controller: newPasswordConfirmsixController,
                                  hintText: 'Confirmar nova senha',
                                  colorTitle: Colors.white,
                                  textInputAction: TextInputAction.done,
                                  textCapitalization: TextCapitalization.none,
                                  textInputType: TextInputType.text,
                                  validator: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'É obrigatorio informar uma senha';
                                    } else if ((value?.length ?? 0) < 6) {
                                      return 'A senha deve conter no minimo 6 caracteres';
                                    } else if (newPasswordController.text !=
                                        value) {
                                      return 'A senha e a confirmação devem ser iguais ';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ButtonStandard(
                      title: 'Redefinir senha',
                      onPressed: () => actionButton(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> actionButton(context) async {
    final requestForgot =
        Provider.of<RequestForgotPPasswordStore>(context, listen: false);

    if (formkey.currentState!.validate()) {
      final statusLoad = await requestForgot.recoveryPassword(
        user: UserModel(
          email: widget.email,
          password: newPasswordController.text,
        ),
      );

      if (statusLoad == StatusLoad.success) {
        Navigator.pop(context);
        NotificationMessage.message(
          context: context,
          firstText: 'Senha atualizada com ',
          highlightedWord: 'sucesso',
        );
      } else {
        NotificationMessageErro.message(
          statusLoad: statusLoad,
          text: 'Não foi possivel atualizar a senha.',
          context: context,
        );
      }
    }
  }
}
