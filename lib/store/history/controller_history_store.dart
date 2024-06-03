import 'package:coodesh/model/word_definitions_model.dart';
import 'package:mobx/mobx.dart';
part 'controller_history_store.g.dart';

class ControllerHistoryStore = ControllerHistoryStoreBase
    with _$ControllerHistoryStore;

abstract class ControllerHistoryStoreBase with Store {
  ObservableList<WordDefinitionsModel?> historyList = ObservableList.of([]);

  @action
  void addItemHistory(WordDefinitionsModel? word) {
    final isContain = historyList.any(
      (element) => element?.word == word?.word,
    );
    if (!isContain) {
      historyList.add(word);
    }
  }

  @action
  WordDefinitionsModel? getWordDefinitions(String word) {
    final result = historyList.firstWhere(
      (element) => element?.word == word,
      orElse: () => null,
    );
    return result;
  }

  @action
  bool isContainsWord(String? word) {
    return historyList.any(
      (element) => element?.word == word,
    );
  }
}
