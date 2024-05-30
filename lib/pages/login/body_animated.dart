import 'package:coodesh/store/login/controller_animated_login_store.dart';
import 'package:coodesh/pages/login/form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BodyAnimated extends StatelessWidget {
  const BodyAnimated({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerLoginStore =
        Provider.of<ControllerAnimatedLoginStore>(context, listen: false);
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: controllerLoginStore.height),
                Observer(
                  builder: (_) {
                    return AnimatedContainer(
                      onEnd: controllerLoginStore.changeIsVisibleBackground,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.linear,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.sizeOf(context).width,
                      height: controllerLoginStore.isTrue,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                        ),
                      ),
                      child: Visibility(
                        visible: controllerLoginStore.isUploadCompletion,
                        child: const FormLogin(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Observer(builder: (_) {
            return SizedBox(
              height: controllerLoginStore.height,
              child: Center(
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: MediaQuery.sizeOf(context).width * .16,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
