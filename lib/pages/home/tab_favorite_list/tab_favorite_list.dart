import 'package:coodesh/pages/home/tab_word_list/card_word_list.dart';
import 'package:coodesh/pages/home/view_word_translation/no_definitions_found.dart';
import 'package:coodesh/store/favorite_word/favorite_word_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TabFavoriteList extends StatefulWidget {
  const TabFavoriteList({Key? key}) : super(key: key);

  @override
  State<TabFavoriteList> createState() => _TabFavoriteListState();
}

class _TabFavoriteListState extends State<TabFavoriteList> {
  @override
  void initState() {
    getFavorites();
    super.initState();
  }

  Future<void> getFavorites() async {
    final favoriteWord = Provider.of<FavoriteWordStore>(context, listen: false);
    await favoriteWord.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteWord = Provider.of<FavoriteWordStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Observer(
        builder: (context) {
          return Visibility(
            visible: favoriteWord.favoriteList.isNotEmpty,
            replacement: const Center(
              child: NoDefinitionsFound(
                title: "There's nothing here yet",
                subTitle: 'Add the first photo and it will appear here',
              ),
            ),
            child: Observer(builder: (_) {
              return GridView.builder(
                itemCount: favoriteWord.favoriteList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (context, index) {
                  final word = favoriteWord.favoriteList[index];
                  return CardWordList(word: word.word);
                },
              );
            }),
          );
        },
      ),
    );
  }
}
