import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/word_definitions_model.dart';
import 'package:coodesh/repository/word_translation_repository.dart';
import 'package:mobx/mobx.dart';
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
    statusLoad = StatusLoad.executing;
    final result = await _roosterListRepository.getTranslation(
      word: word,
    );
    if (result?.body?.isNotEmpty ?? false) {
      wordDefinitions = result?.body?.first;
    }
    await Future.delayed(
      const Duration(seconds: 2),
      () => statusLoad = verificStatus(result?.statusCode),
    );
  }
}
