import 'package:coodesh/pages/home/tab_word_list/card_word_list.dart';
import 'package:coodesh/store/home/controller_dictionary_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TabWordList extends StatelessWidget {
  const TabWordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictionary =
        Provider.of<ControllerDictionaryStore>(context, listen: false);
    return RawScrollbar(
      thumbColor: Colors.white,
      radius: const Radius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (scrollEnd) {
            final metrics = scrollEnd.metrics;
            if (metrics.atEdge) {
              final bool isBottom = metrics.pixels != 0;
              if (isBottom) dictionary.loadWord();
            }
            return true;
          },
          child: Observer(
            builder: (context) {
              return GridView.builder(
                itemCount: dictionary.wordsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final word = dictionary.wordsList[index];
                  return CardWordList(word: word);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
