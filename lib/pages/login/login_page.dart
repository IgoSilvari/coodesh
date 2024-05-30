import 'package:coodesh/colors.dart';
import 'package:coodesh/store/login/controller_animated_login_store.dart';
import 'package:coodesh/store/login/request_login_store.dart';
import 'package:coodesh/pages/login/body_animated.dart';
import 'package:coodesh/pages/widget/overlay_loading_standard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    callAnimated();
  }

  void callAnimated() {
    final controllerLoginStore =
        Provider.of<ControllerAnimatedLoginStore>(context, listen: false);
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        controllerLoginStore.changeHeightCard();
        _animationController.forward();
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controllerLoginStore =
        Provider.of<ControllerAnimatedLoginStore>(context, listen: false);
    final requestLogin = Provider.of<RequestLoginStore>(context, listen: false);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: CoodeshColor.linearGradient,
      ),
      child: Observer(
        builder: (_) {
          return OverlayLoadingStandard(
            isVisible: requestLogin.isExecution,
            child: Stack(
              children: [
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: controllerLoginStore.isUploadCompletion,
                      child: Positioned(
                        bottom: 0,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height / 2,
                            width: MediaQuery.sizeOf(context).width,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height,
                        ),
                        const BodyAnimated(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
