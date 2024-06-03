import 'package:coodesh/pages/widget/button_standard.dart';
import 'package:coodesh/store/home/controller_dictionary_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ButtonBackNextWord extends StatelessWidget {
  const ButtonBackNextWord({required this.backNextAction, Key? key})
      : super(key: key);

  final Future<void> Function(String) backNextAction;

  @override
  Widget build(BuildContext context) {
    final dictionary =
        Provider.of<ControllerDictionaryStore>(context, listen: false);
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
          height: 100,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: Row(
            children: [
              Expanded(
                child: Observer(builder: (_) {
                  return ButtonStandard(
                    onPressed: () {
                      final newWord = dictionary.checkNextPreviousWord(
                        ButtonBackNext.back,
                      );
                      backNextAction(newWord);
                    },
                    title: 'Back',
                    isGradient: false,
                    isEnable: dictionary.isActiveButtonBack,
                  );
                }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Observer(builder: (_) {
                  return ButtonStandard(
                    onPressed: () {
                      final newWord = dictionary.checkNextPreviousWord(
                        ButtonBackNext.next,
                      );
                      backNextAction(newWord);
                    },
                    title: 'Next',
                    isGradient: false,
                    isEnable: dictionary.isActiveButtonNext,
                  );
                }),
              ),
            ],
          )),
    );
  }
}
