import 'package:coodesh/colors.dart';
import 'package:coodesh/pages/home/view_word_translation/app_bar_view_translation.dart';
import 'package:coodesh/pages/home/view_word_translation/button_back_next_word.dart';
import 'package:coodesh/pages/home/view_word_translation/card_word.dart';
import 'package:coodesh/pages/home/view_word_translation/no_definitions_found.dart';
import 'package:coodesh/pages/home/view_word_translation/widget_progress_speak.dart';
import 'package:coodesh/pages/home/view_word_translation/word_definition_fields.dart';
import 'package:coodesh/pages/widget/adapt_screen_dimensions.dart';
import 'package:coodesh/store/favorite_word/favorite_word_store.dart';
import 'package:coodesh/store/home/controller_dictionary_store.dart';
import 'package:coodesh/store/word_translaton/controller_progress_audio_store.dart';
import 'package:coodesh/store/word_translaton/request_word_translation_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class ViewWordTranslationPage extends StatefulWidget {
  const ViewWordTranslationPage({required this.word, Key? key})
      : super(key: key);

  final String word;

  @override
  State<ViewWordTranslationPage> createState() =>
      _ViewWordTranslationPageState();
}

class _ViewWordTranslationPageState extends State<ViewWordTranslationPage> {
  late FlutterTts flutterTts;
  @override
  void initState() {
    flutterTts = FlutterTts();
    setLanguage();
    loadDataDictionary(word: widget.word);
    getDataFavorite(word: widget.word);
    super.initState();
  }

  Future<void> loadDataDictionary({required String word}) async {
    final wordTranslation =
        Provider.of<RequestWordTranslationStore>(context, listen: false);
    final controllerProgress =
        Provider.of<ControllerProgressAudioStore>(context, listen: false);
    final dictionary =
        Provider.of<ControllerDictionaryStore>(context, listen: false);

    wordTranslation.getWordTranslation(word: word);
    controllerProgress.changeText(word);
    dictionary.changeWordSelected(word);
    dictionary.activeButton();
  }

  Future<void> setLanguage() async {
    final controllerProgress =
        Provider.of<ControllerProgressAudioStore>(context, listen: false);
    await flutterTts.setLanguage("en-US");

    flutterTts.awaitSpeakCompletion(false);

    flutterTts.setProgressHandler((_, int startOffset, int endOffset, __) {
      controllerProgress.changeEndOffset(endOffset);
    });

    flutterTts.setCompletionHandler(() {
      controllerProgress.cleanData();
      controllerProgress.changeProgressAudio(StateProgress.paused);
    });
  }

  Future<void> getDataFavorite({required String word}) async {
    final favoriteWord = Provider.of<FavoriteWordStore>(context, listen: false);
    favoriteWord.checkFavorite(word: word);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    final wordTranslation =
        Provider.of<RequestWordTranslationStore>(context, listen: false);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: CoodeshColor.linearGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppBarViewTranslation(),
        bottomNavigationBar: ButtonBackNextWord(
          backNextAction: (value) async {
            loadDataDictionary(word: value);
            getDataFavorite(word: value);
          },
        ),
        body: AdaptScreenDimensions(
          child: Observer(builder: (_) {
            return Visibility(
              visible: wordTranslation.isLoadingExecuting,
              replacement: Observer(builder: (_) {
                return Visibility(
                  visible: wordTranslation.isLoadingErro,
                  replacement: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CardWord(),
                      WidgetProgressSpeak(
                        flutterTts: flutterTts,
                        word: widget.word,
                      ),
                      const WordDefinitionFields(),
                    ],
                  ),
                  child: const Center(
                    child: NoDefinitionsFound(
                      title: 'Ops!',
                      subTitle: 'No Definitions Found',
                    ),
                  ),
                );
              }),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
