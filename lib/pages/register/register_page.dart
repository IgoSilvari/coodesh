import 'package:coodesh/database/user_dao/user_dao.dart';
import 'package:coodesh/helper/notification_message_erro.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';
import 'package:coodesh/pages/widget/overlay_pattern_button.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/login/controller_password_store.dart';
import 'package:coodesh/store/register/request_register_user_store.dart';
import 'package:coodesh/pages/widget/adapt_screen_dimensions.dart';
import 'package:coodesh/pages/widget/background_defaut.dart';
import 'package:coodesh/pages/widget/overlay_loading_standard.dart';
import 'package:coodesh/pages/widget/widget_form_field_defaut.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerConfirmPassword;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerConfirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerPasswordStore =
        Provider.of<ControllerPasswordStore>(context, listen: false);
    final requestRegister =
        Provider.of<RequestRegisterUserStore>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: OverlayPatternButton(
        title: 'Cadastrar',
        onPressed: register,
      ),
      body: Observer(
        builder: (_) {
          return OverlayLoadingStandard(
            isVisible: requestRegister.isExecution,
            child: BackgraundDefaut(
              title: 'SingUp',
              top: 50,
              onPressedLeading: actionButtonLeading,
              child: AdaptScreenDimensions(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          WidgetFormFieldDefaut(
                            title: 'Nome',
                            hintText: 'Informe seu nome',
                            controller: controllerName,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'É obrigatorio informar um nome';
                              }
                              return null;
                            },
                          ),
                          WidgetFormFieldDefaut(
                            title: 'E-mail',
                            hintText: 'E-mail',
                            controller: controllerEmail,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            validator: (value) {
                              final isValid =
                                  EmailValidator.validate(value ?? '');
                              if (value?.isEmpty ?? true) {
                                return 'É obrigatorio informar o email';
                              } else if (!isValid) {
                                return 'E-mail informado é invalido';
                              }
                              return null;
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return WidgetFormFieldDefaut(
                                title: 'Senha',
                                hintText: '******',
                                controller: controllerPassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.next,
                                textCapitalization: TextCapitalization.none,
                                actionObscureText:
                                    controllerPasswordStore.changeIsVisible,
                                suffixIconVisibility: const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                                suffixIconVisibilityOff: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                isObscureText:
                                    controllerPasswordStore.isVisiblePassword,
                                isVisibleSuffix: true,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'É obrigatorio informar a senha';
                                  } else if ((value?.length ?? 0) < 6) {
                                    return 'A senha deve conter no minimo 6 caracteres';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          Observer(
                            builder: (_) {
                              return WidgetFormFieldDefaut(
                                title: 'Confirmar Senha',
                                hintText: '******',
                                controller: controllerConfirmPassword,
                                textInputType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done,
                                textCapitalization: TextCapitalization.none,
                                actionObscureText: controllerPasswordStore
                                    .changeIsVisibleConfirm,
                                suffixIconVisibility: const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                                suffixIconVisibilityOff: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                isObscureText: controllerPasswordStore
                                    .isVisibleConfirmPassword,
                                isVisibleSuffix: true,
                                validator: (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'É obrigatorio informar a senha';
                                  } else if ((value?.length ?? 0) < 6) {
                                    return 'A senha deve conter no minimo 6 caracteres';
                                  } else if (controllerPassword.text != value) {
                                    return 'As senhas devem ser iguais';
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void actionButtonLeading() {
    Navigator.of(context).pushReplacementNamed(AppRouter.loginPage);
  }

  Future<void> register() async {
    final requestRegister =
        Provider.of<RequestRegisterUserStore>(context, listen: false);
    if (formkey.currentState!.validate()) {
      final listUsers = await UserDao().findAll();
      final statusLoad = await requestRegister.saveUserData(
        user: UserModel(
          id: listUsers.length + 1,
          name: controllerName.text,
          email: controllerEmail.text,
          password: controllerPassword.text,
        ),
      );
      if (StatusLoad.success == statusLoad) {
        if (context.mounted) {}
      } else {
        if (!mounted) return;
        NotificationMessageErro.message(
          statusLoad: statusLoad,
          context: context,
        );
      }
    }
  }
}
