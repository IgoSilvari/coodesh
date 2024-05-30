import 'package:coodesh/pages/home/home_page.dart';
import 'package:coodesh/store/forgot_password/request_forgot_password_store.dart';
import 'package:coodesh/store/login/controller_animated_login_store.dart';
import 'package:coodesh/store/login/controller_password_store.dart';
import 'package:coodesh/store/login/request_login_store.dart';
import 'package:coodesh/store/profile/controller_image_profile_store.dart';
import 'package:coodesh/store/profile/request_update_profile_store.dart';
import 'package:coodesh/store/register/request_register_user_store.dart';
import 'package:coodesh/pages/login/forgot_password/forgot_password_page.dart';
import 'package:coodesh/pages/login/forgot_password/recovery_instructions_screen.dart';
import 'package:coodesh/pages/login/login_page.dart';
import 'package:coodesh/pages/profile/profile_page.dart';
import 'package:coodesh/pages/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class Router {
  Route<dynamic> generateRoute(RouteSettings settings);
}

class AppRouter extends Router {
  static const loginPage = '/loginPage';
  static const forgotPasswordPage = '/forgotPasswordPage';
  static const registerPage = '/registerPage';
  static const recoveryInstructionsPage = '/recoveryInstructionsPage';
  static const profilePage = '/profilePage';
  static const homePage = '/homePage';

  @override
  Route generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    switch (settings.name) {
      case loginPage:
        builder = (BuildContext _) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerAnimatedLoginStore()),
              Provider(create: (_) => ControllerPasswordStore()),
              Provider(create: (_) => RequestLoginStore()),
            ],
            child: const LoginPage(),
          );
        };
      case forgotPasswordPage:
        builder = (context) {
          return Provider(
            create: (_) => RequestForgotPPasswordStore(),
            child: const ForgotPasswordPage(),
          );
        };
        break;
      case recoveryInstructionsPage:
        builder = (context) {
          return Provider(
            create: (_) => RequestForgotPPasswordStore(),
            child: RecoveryInstructionsPage(
              email: settings.arguments as String,
            ),
          );
        };
        break;
      case registerPage:
        builder = (BuildContext _) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerAnimatedLoginStore()),
              Provider(create: (_) => ControllerPasswordStore()),
              Provider(create: (_) => RequestRegisterUserStore()),
            ],
            child: const RegisterPage(),
          );
        };
        break;

      case profilePage:
        builder = (context) {
          return MultiProvider(
            providers: [
              Provider(create: (_) => ControllerImageProfileStore()),
              Provider(create: (_) => RequestUpdateProfileStore()),
            ],
            child: const ProfilePage(),
          );
        };
      case homePage:
        builder = (context) {
          return MultiProvider(
            providers: [
              //Remover
              Provider(create: (_) => ControllerImageProfileStore()),
            ],
            child: const HomePage(),
          );
        };

      default:
        throw UnimplementedError('Invalid router: ${settings.name}');
    }
    return MaterialPageRoute(builder: builder, settings: settings);
  }

  static final navigatorKey = GlobalKey<NavigatorState>();
}
