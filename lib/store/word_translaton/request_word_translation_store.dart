import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/word_definitions_model.dart';
import 'package:coodesh/repository/word_translation_repository.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/history/controller_history_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'request_word_translation_store.g.dart';

class RequestWordTranslationStore = RequestWordTranslationStoreBase
    with _$RequestWordTranslationStore;

abstract class RequestWordTranslationStoreBase with Store {
  final RoosterListRepository _roosterListRepository =
      const RoosterListRepository();

  @observable
  WordDefinitionsModel? wordDefinitions;

  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isLoadingNone => statusLoad == StatusLoad.none;

  @computed
  bool get isLoadingSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isLoadingExecuting => statusLoad == StatusLoad.executing;

  @computed
  bool get isLoadingErro =>
      !isLoadingSuccess || !isLoadingExecuting && isLoadingNone;

  @action
  Future<void> getWordTranslation({
    required String word,
  }) async {
    final context = AppRouter.navigatorKey.currentContext!;
    final controllerHistory =
        Provider.of<ControllerHistoryStore>(context, listen: false);
    statusLoad = StatusLoad.executing;
    if (controllerHistory.isContainsWord(word)) {
      await getWordTranslationHistory(word);
    } else {
      await getWordTranslationServe(word);
    }
  }

  @action
  Future<void> getWordTranslationServe(String word) async {
    final result = await _roosterListRepository.getTranslation(
      word: word,
    );
    if (result?.body?.isNotEmpty ?? false) {
      wordDefinitions = result?.body?.first;
    }
    addItemHistory(word);
    statusLoad = verificStatus(result?.statusCode);
  }

  @action
  Future<void> getWordTranslationHistory(String word) async {
    final globalContext = AppRouter.navigatorKey.currentContext!;
    final controllerHistory =
        Provider.of<ControllerHistoryStore>(globalContext, listen: false);

    final result = controllerHistory.getWordDefinitions(word);
    wordDefinitions = result;

    statusLoad = verificStatus(200);
  }

  @action
  void addItemHistory(String? word) {
    final globalContext = AppRouter.navigatorKey.currentContext!;
    final controllerHistory =
        Provider.of<ControllerHistoryStore>(globalContext, listen: false);

    final wordModel = WordDefinitionsModel(
      word: word,
      phonetics: wordDefinitions?.phonetics,
      sourceUrls: wordDefinitions?.sourceUrls,
      meanings: wordDefinitions?.meanings,
      license: wordDefinitions?.license,
    );

    controllerHistory.addItemHistory(wordModel);
  }
}
