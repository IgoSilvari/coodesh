import 'package:coodesh/store/word_translaton/request_word_translation_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CardWord extends StatelessWidget {
  const CardWord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordTranslation =
        Provider.of<RequestWordTranslationStore>(context, listen: false);
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (_) {
            return Text(
              wordTranslation.wordDefinitions?.word ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black, fontSize: 30),
            );
          }),
        ],
      ),
    );
  }
}
