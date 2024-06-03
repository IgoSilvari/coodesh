import 'package:coodesh/helper/notification_message.dart';
import 'package:coodesh/helper/notification_message_erro.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:coodesh/store/profile/controller_image_profile_store.dart';
import 'package:coodesh/store/profile/request_update_profile_store.dart';
import 'package:coodesh/pages/profile/widget_change_avatar.dart';
import 'package:coodesh/pages/widget/background_defaut.dart';
import 'package:coodesh/pages/widget/button_standard.dart';
import 'package:coodesh/pages/widget/overlay_loading_standard.dart';
import 'package:coodesh/pages/widget/widget_form_field_defaut.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    loadDataUser();
    super.initState();
  }

  void loadDataUser() {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    UserModel? user = dataUserLogged.userData;
    controllerName = TextEditingController(text: user?.name ?? '');
    controllerEmail = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateProfile =
        Provider.of<RequestUpdateProfileStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Scaffold(
          body: OverlayLoadingStandard(
            isVisible: updateProfile.isExecution,
            child: BackgraundDefaut(
              title: 'Perfil',
              top: 50,
              onPressedLeading: () => Navigator.pop(context),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const WidgetChangeAvatar(),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 130, bottom: 10),
                        child: ButtonStandard(
                          onPressed: () => actionUpdateProfile(),
                          title: 'Salvar',
                        ),
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

  Future<void> actionUpdateProfile() async {
    final controllerImageProfile =
        Provider.of<ControllerImageProfileStore>(context, listen: false);
    final updateProfile =
        Provider.of<RequestUpdateProfileStore>(context, listen: false);
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);

    if (formkey.currentState!.validate()) {
      bool isNotEmpty = controllerImageProfile.localImage.isNotEmpty;
      final localImage = controllerImageProfile.localImage;
      final pictureData = dataUserLogged.userData?.picture;
      final statusLoad = await updateProfile.updateProfile(
        user: UserModel(
          id: dataUserLogged.userData!.id!,
          email: controllerEmail.text,
          name: controllerName.text,
          picture: isNotEmpty ? localImage : pictureData,
        ),
      );
      if (statusLoad == StatusLoad.success) {
        if (!mounted) return;
        NotificationMessage.message(
          firstText: 'Dados atualizados com sucesso',
          context: context,
        );
      } else {
        if (!mounted) return;
        NotificationMessageErro.message(
          statusLoad: statusLoad,
          text: 'Ocorreu um erro na atualização',
          context: context,
        );
      }
    }
  }
}
