import 'dart:io';
import 'package:coodesh/colors.dart';
import 'package:coodesh/helper/models_utils.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:coodesh/store/profile/controller_image_profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class WidgetChangeAvatar extends StatelessWidget {
  const WidgetChangeAvatar(
      {this.raiusMain = 50,
      this.raiusSecundary = 48,
      this.isVisibleSelectImage = true,
      super.key});

  final double raiusMain;
  final double raiusSecundary;
  final bool isVisibleSelectImage;

  @override
  Widget build(BuildContext context) {
    final controllerImageProfile =
        Provider.of<ControllerImageProfileStore>(context, listen: false);
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Stack(
          children: [
            CircleAvatar(
              radius: raiusMain,
              backgroundColor: CoodeshColor.defaultRedColor,
              child: Visibility(
                visible: controllerImageProfile.localImage.isNotEmpty,
                replacement: Visibility(
                  visible: dataUserLogged.isNotEmptyImage,
                  replacement: CircleAvatar(
                    radius: raiusSecundary,
                    backgroundColor: CoodeshColor.appPrimarySwatch,
                    child: Text(
                      ModelsUtils.userNameInitials(
                        name: dataUserLogged.userData?.name ?? '',
                      ),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: raiusSecundary,
                    backgroundImage: FileImage(
                      File(
                        dataUserLogged.userData?.picture ?? '',
                      ),
                    ),
                    onBackgroundImageError: (exception, stackTrace) {
                      controllerImageProfile.changeErroLoad();
                    },
                    child: Visibility(
                      visible: controllerImageProfile.isErroLoad,
                      child: Text(
                        ModelsUtils.userNameInitials(
                          name: dataUserLogged.userData?.name ?? '',
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: raiusSecundary,
                  backgroundImage: FileImage(
                    File(
                      controllerImageProfile.localImage,
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isVisibleSelectImage,
              child: Positioned(
                right: -2,
                bottom: -10,
                child: IconButton(
                  onPressed: () => selectedImage(context),
                  icon: const Icon(
                    Icons.photo_camera,
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> selectedImage(context) async {
    final imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      final controllerImage =
          Provider.of<ControllerImageProfileStore>(context, listen: false);

      controllerImage.changeLocalImage(file.path);
    }
  }
}
