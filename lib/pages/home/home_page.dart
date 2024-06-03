import 'package:coodesh/colors.dart';
import 'package:coodesh/pages/home/app_bar/app_bar_home.dart';
import 'package:coodesh/pages/home/tab_favorite_list/tab_favorite_list.dart';
import 'package:coodesh/pages/home/tab_history_list/tab_history_list.dart';
import 'package:coodesh/pages/home/tab_word_list/tab_word_list.dart';
import 'package:coodesh/store/favorite_word/favorite_word_store.dart';
import 'package:coodesh/store/home/controller_dictionary_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 3,
    );
    getWordDictionary();
    super.initState();
  }

  Future<void> getWordDictionary() async {
    final dictionary =
        Provider.of<ControllerDictionaryStore>(context, listen: false);
    dictionary.loadWord();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHome(
        controller: _tabController,
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: CoodeshColor.linearGradient,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              const TabWordList(),
              const TabHistoryList(),
              Provider(
                create: (context) => FavoriteWordStore(),
                child: const TabFavoriteList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
