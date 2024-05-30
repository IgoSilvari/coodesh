import 'dart:io';

import 'package:coodesh/colors.dart';
import 'package:coodesh/helper/models_utils.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:coodesh/store/profile/controller_image_profile_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetImageUser extends StatelessWidget {
  const WidgetImageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerImageProfile =
        Provider.of<ControllerImageProfileStore>(context, listen: false);
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    return Center(
      child: CircleAvatar(
        radius: 22,
        backgroundColor: CoodeshColor.defaultRedColor,
        child: Visibility(
          visible: dataUserLogged.isNotEmptyImage,
          replacement: CircleAvatar(
            radius: 20,
            backgroundColor: CoodeshColor.appPrimarySwatch,
            child: Text(
              ModelsUtils.userNameInitials(
                name: dataUserLogged.userData?.name ?? '',
              ),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
