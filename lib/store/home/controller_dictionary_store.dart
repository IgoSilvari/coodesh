// ignore_for_file: unnecessary_statements

import 'dart:convert';

import 'package:coodesh/helper/status_loading.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
part 'controller_dictionary_store.g.dart';

class ControllerDictionaryStore = ControllerDictionaryStoreBase
    with _$ControllerDictionaryStore;

abstract class ControllerDictionaryStoreBase with Store {
  //Controlar paginação da lista
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  ObservableList<String> wordsList = ObservableList.of([]);

  @observable
  int indexCurrent = 0;

  @observable
  int quantityPage = 50;

  @action
  Future<void> loadWord() async {
    statusLoad = StatusLoad.executing;
    final words = await rootBundle.loadString(
      'assets/dictionary/words_dictionary.json',
    );
    final Map<String, dynamic> wordsJson = json.decode(words);

    final wordsConverted = wordsJson.keys.toList();
    for (indexCurrent; wordsConverted.length >= indexCurrent; indexCurrent++) {
      final value = wordsConverted[indexCurrent];
      if (indexCurrent <= quantityPage) {
        wordsList.add(value);
      } else {
        quantityPage += 50;
        break;
      }
    }
    await Future.delayed(const Duration(seconds: 2));
    statusLoad = StatusLoad.success;
  }
//Fim

//Pegar palavra a ser verificada/Traduzida
  @observable
  String wordSelected = '';

  void changeWordSelected(String word) => wordSelected = word;

//Fim

// Verificar a palavra anterior ou a proxima da plavra atual
  @action
  String checkNextPreviousWord(ButtonBackNext backNext) {
    final index = wordsList.indexOf(wordSelected);

    switch (backNext) {
      case ButtonBackNext.back:
        if (index > 0) {
          return wordsList[index - 1];
        }
      case ButtonBackNext.next:
        if ((index + 1) < wordsList.length) {
          return wordsList[index + 1];
        }
      default:
        return '';
    }
    return '';
  }
//Fim

//Ativar ou não os botões para chamar a proxima palavra
  @observable
  bool isActiveButtonBack = false;

  @observable
  bool isActiveButtonNext = false;

  @action
  void activeButton() {
    final index = wordsList.indexOf(wordSelected);

    if (index > 0) {
      isActiveButtonBack = true;
    } else {
      isActiveButtonBack = false;
    }

    if ((index + 1) < wordsList.length) {
      isActiveButtonNext = true;
    } else {
      isActiveButtonNext = false;
    }
  }
//Fim
}

enum ButtonBackNext { back, next }
