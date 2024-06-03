import 'dart:async';

import 'package:coodesh/helper/keyword_shared_preferences.dart';
import 'package:coodesh/pages/home/app_bar/tap_bar_home.dart';
import 'package:coodesh/pages/home/app_bar/widget_image_user.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({required this.controller, Key? key}) : super(key: key);

  final TabController? controller;

  @override
  Size get preferredSize => const Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/images/logo.png',
        width: 120,
      ),
      centerTitle: true,
      toolbarHeight: 140,
      leading: const WidgetImageUser(),
      actions: [
        IconButton(
          onPressed: () => exitApp(context),
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
      bottom: TapBarHome(controller: controller),
    );
  }

  Future<void> exitApp(context) async {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(KeywordShared.idUser.name);
    dataUserLogged.cleanUserData();
    unawaited(Navigator.of(context).pushReplacementNamed(AppRouter.loginPage));
  }
}
