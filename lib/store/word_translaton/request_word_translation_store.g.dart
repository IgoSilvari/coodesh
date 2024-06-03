// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_word_translation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RequestWordTranslationStore on RequestWordTranslationStoreBase, Store {
  Computed<bool>? _$isLoadingNoneComputed;

  @override
  bool get isLoadingNone =>
      (_$isLoadingNoneComputed ??= Computed<bool>(() => super.isLoadingNone,
              name: 'RequestWordTranslationStoreBase.isLoadingNone'))
          .value;
  Computed<bool>? _$isLoadingSuccessComputed;

  @override
  bool get isLoadingSuccess => (_$isLoadingSuccessComputed ??= Computed<bool>(
          () => super.isLoadingSuccess,
          name: 'RequestWordTranslationStoreBase.isLoadingSuccess'))
      .value;
  Computed<bool>? _$isLoadingExecutingComputed;

  @override
  bool get isLoadingExecuting => (_$isLoadingExecutingComputed ??=
          Computed<bool>(() => super.isLoadingExecuting,
              name: 'RequestWordTranslationStoreBase.isLoadingExecuting'))
      .value;
  Computed<bool>? _$isLoadingErroComputed;

  @override
  bool get isLoadingErro =>
      (_$isLoadingErroComputed ??= Computed<bool>(() => super.isLoadingErro,
              name: 'RequestWordTranslationStoreBase.isLoadingErro'))
          .value;

  late final _$wordDefinitionsAtom = Atom(
      name: 'RequestWordTranslationStoreBase.wordDefinitions',
      context: context);

  @override
  WordDefinitionsModel? get wordDefinitions {
    _$wordDefinitionsAtom.reportRead();
    return super.wordDefinitions;
  }

  @override
  set wordDefinitions(WordDefinitionsModel? value) {
    _$wordDefinitionsAtom.reportWrite(value, super.wordDefinitions, () {
      super.wordDefinitions = value;
    });
  }

  late final _$statusLoadAtom = Atom(
      name: 'RequestWordTranslationStoreBase.statusLoad', context: context);

  @override
  StatusLoad get statusLoad {
    _$statusLoadAtom.reportRead();
    return super.statusLoad;
  }

  @override
  set statusLoad(StatusLoad value) {
    _$statusLoadAtom.reportWrite(value, super.statusLoad, () {
      super.statusLoad = value;
    });
  }

  late final _$getWordTranslationAsyncAction = AsyncAction(
      'RequestWordTranslationStoreBase.getWordTranslation',
      context: context);

  @override
  Future<void> getWordTranslation({required String word}) {
    return _$getWordTranslationAsyncAction
        .run(() => super.getWordTranslation(word: word));
  }

  late final _$getWordTranslationServeAsyncAction = AsyncAction(
      'RequestWordTranslationStoreBase.getWordTranslationServe',
      context: context);

  @override
  Future<void> getWordTranslationServe(String word) {
    return _$getWordTranslationServeAsyncAction
        .run(() => super.getWordTranslationServe(word));
  }

  late final _$getWordTranslationHistoryAsyncAction = AsyncAction(
      'RequestWordTranslationStoreBase.getWordTranslationHistory',
      context: context);

  @override
  Future<void> getWordTranslationHistory(String word) {
    return _$getWordTranslationHistoryAsyncAction
        .run(() => super.getWordTranslationHistory(word));
  }

  late final _$RequestWordTranslationStoreBaseActionController =
      ActionController(
          name: 'RequestWordTranslationStoreBase', context: context);

  @override
  void addItemHistory(String? word) {
    final _$actionInfo = _$RequestWordTranslationStoreBaseActionController
        .startAction(name: 'RequestWordTranslationStoreBase.addItemHistory');
    try {
      return super.addItemHistory(word);
    } finally {
      _$RequestWordTranslationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wordDefinitions: ${wordDefinitions},
statusLoad: ${statusLoad},
isLoadingNone: ${isLoadingNone},
isLoadingSuccess: ${isLoadingSuccess},
isLoadingExecuting: ${isLoadingExecuting},
isLoadingErro: ${isLoadingErro}
    ''';
  }
}
