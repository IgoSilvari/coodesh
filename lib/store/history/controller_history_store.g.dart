// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerHistoryStore on ControllerHistoryStoreBase, Store {
  late final _$ControllerHistoryStoreBaseActionController =
      ActionController(name: 'ControllerHistoryStoreBase', context: context);

  @override
  void addItemHistory(WordDefinitionsModel? word) {
    final _$actionInfo = _$ControllerHistoryStoreBaseActionController
        .startAction(name: 'ControllerHistoryStoreBase.addItemHistory');
    try {
      return super.addItemHistory(word);
    } finally {
      _$ControllerHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  WordDefinitionsModel? getWordDefinitions(String word) {
    final _$actionInfo = _$ControllerHistoryStoreBaseActionController
        .startAction(name: 'ControllerHistoryStoreBase.getWordDefinitions');
    try {
      return super.getWordDefinitions(word);
    } finally {
      _$ControllerHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isContainsWord(String? word) {
    final _$actionInfo = _$ControllerHistoryStoreBaseActionController
        .startAction(name: 'ControllerHistoryStoreBase.isContainsWord');
    try {
      return super.isContainsWord(word);
    } finally {
      _$ControllerHistoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
