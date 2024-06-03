import 'dart:async';

import 'package:coodesh/colors.dart';
import 'package:coodesh/database/user_dao/user_dao.dart';
import 'package:coodesh/helper/keyword_shared_preferences.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    systemChrome();
    loadDataApp();
    super.initState();
  }

  @override
  void dispose() {
    backSystemDefaut();
    super.dispose();
  }

  void systemChrome() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  void backSystemDefaut() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarColor: Colors.white,
      ),
    );
  }

  Future<void> loadDataApp() async {
    final dataUserLogged =
        Provider.of<DataUserLoggedStore>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getInt(KeywordShared.idUser.name);

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        if (idUser != null) {
          final user = await UserDao().getDataUser(idUser);
          dataUserLogged.changeUser(user);
          if (context.mounted) {
            unawaited(
                Navigator.of(context).pushReplacementNamed(AppRouter.homePage));
          }
        } else {
          if (context.mounted) {
            unawaited(Navigator.of(context)
                .pushReplacementNamed(AppRouter.loginPage));
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LaunchScreenPage(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Hero(
              tag: 'logo',
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  color: Colors.white,
                  height: MediaQuery.sizeOf(context).width * .20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LaunchScreenPage extends StatelessWidget {
  const LaunchScreenPage({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned.fill(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: CoodeshColor.linearGradient),
          ),
        ),
        ...children
      ],
    );
  }
}
