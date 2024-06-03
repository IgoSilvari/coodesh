import 'package:coodesh/colors.dart';
import 'package:coodesh/store/word_translaton/request_word_translation_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class WordDefinitionFields extends StatelessWidget {
  const WordDefinitionFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordTranslation =
        Provider.of<RequestWordTranslationStore>(context, listen: false);
    return Column(
      children: [
        Text(
          'Meanings',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Observer(builder: (_) {
            final meanings = wordTranslation.wordDefinitions?.meanings;
            return ListView.builder(
              itemCount: meanings?.length ?? 0,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final meaning = meanings?[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        meaning?.partOfSpeech?.toUpperCase() ?? '',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: CoodeshColor.colorWhiteTitle,
                                ),
                      ),
                      Text(
                        meaning?.definitions?.first.definition ?? '',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: CoodeshColor.colorWhiteSubtitle,
                                ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
