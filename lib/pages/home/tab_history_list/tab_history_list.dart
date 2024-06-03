import 'package:coodesh/pages/home/tab_word_list/card_word_list.dart';
import 'package:coodesh/pages/home/view_word_translation/no_definitions_found.dart';
import 'package:coodesh/store/history/controller_history_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TabHistoryList extends StatelessWidget {
  const TabHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerHistory =
        Provider.of<ControllerHistoryStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Observer(
        builder: (context) {
          return Visibility(
            visible: controllerHistory.historyList.isNotEmpty,
            replacement: const Center(
              child: NoDefinitionsFound(
                title: "There's nothing here yet",
                subTitle: '',
              ),
            ),
            child: Observer(builder: (_) {
              return GridView.builder(
                itemCount: controllerHistory.historyList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final wordDefinitions = controllerHistory.historyList[index];
                  return CardWordList(word: wordDefinitions?.word);
                },
              );
            }),
          );
        },
      ),
    );
  }
}
