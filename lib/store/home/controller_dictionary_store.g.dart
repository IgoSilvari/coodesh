// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_dictionary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerDictionaryStore on ControllerDictionaryStoreBase, Store {
  Computed<bool>? _$isExecutionComputed;

  @override
  bool get isExecution =>
      (_$isExecutionComputed ??= Computed<bool>(() => super.isExecution,
              name: 'ControllerDictionaryStoreBase.isExecution'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'ControllerDictionaryStoreBase.isSuccess'))
          .value;

  late final _$statusLoadAtom =
      Atom(name: 'ControllerDictionaryStoreBase.statusLoad', context: context);

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

  late final _$indexCurrentAtom = Atom(
      name: 'ControllerDictionaryStoreBase.indexCurrent', context: context);

  @override
  int get indexCurrent {
    _$indexCurrentAtom.reportRead();
    return super.indexCurrent;
  }

  @override
  set indexCurrent(int value) {
    _$indexCurrentAtom.reportWrite(value, super.indexCurrent, () {
      super.indexCurrent = value;
    });
  }

  late final _$quantityPageAtom = Atom(
      name: 'ControllerDictionaryStoreBase.quantityPage', context: context);

  @override
  int get quantityPage {
    _$quantityPageAtom.reportRead();
    return super.quantityPage;
  }

  @override
  set quantityPage(int value) {
    _$quantityPageAtom.reportWrite(value, super.quantityPage, () {
      super.quantityPage = value;
    });
  }

  late final _$wordSelectedAtom = Atom(
      name: 'ControllerDictionaryStoreBase.wordSelected', context: context);

  @override
  String get wordSelected {
    _$wordSelectedAtom.reportRead();
    return super.wordSelected;
  }

  @override
  set wordSelected(String value) {
    _$wordSelectedAtom.reportWrite(value, super.wordSelected, () {
      super.wordSelected = value;
    });
  }

  late final _$isActiveButtonBackAtom = Atom(
      name: 'ControllerDictionaryStoreBase.isActiveButtonBack',
      context: context);

  @override
  bool get isActiveButtonBack {
    _$isActiveButtonBackAtom.reportRead();
    return super.isActiveButtonBack;
  }

  @override
  set isActiveButtonBack(bool value) {
    _$isActiveButtonBackAtom.reportWrite(value, super.isActiveButtonBack, () {
      super.isActiveButtonBack = value;
    });
  }

  late final _$isActiveButtonNextAtom = Atom(
      name: 'ControllerDictionaryStoreBase.isActiveButtonNext',
      context: context);

  @override
  bool get isActiveButtonNext {
    _$isActiveButtonNextAtom.reportRead();
    return super.isActiveButtonNext;
  }

  @override
  set isActiveButtonNext(bool value) {
    _$isActiveButtonNextAtom.reportWrite(value, super.isActiveButtonNext, () {
      super.isActiveButtonNext = value;
    });
  }

  late final _$loadWordAsyncAction =
      AsyncAction('ControllerDictionaryStoreBase.loadWord', context: context);

  @override
  Future<void> loadWord() {
    return _$loadWordAsyncAction.run(() => super.loadWord());
  }

  late final _$ControllerDictionaryStoreBaseActionController =
      ActionController(name: 'ControllerDictionaryStoreBase', context: context);

  @override
  String checkNextPreviousWord(ButtonBackNext backNext) {
    final _$actionInfo =
        _$ControllerDictionaryStoreBaseActionController.startAction(
            name: 'ControllerDictionaryStoreBase.checkNextPreviousWord');
    try {
      return super.checkNextPreviousWord(backNext);
    } finally {
      _$ControllerDictionaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activeButton() {
    final _$actionInfo = _$ControllerDictionaryStoreBaseActionController
        .startAction(name: 'ControllerDictionaryStoreBase.activeButton');
    try {
      return super.activeButton();
    } finally {
      _$ControllerDictionaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusLoad: ${statusLoad},
indexCurrent: ${indexCurrent},
quantityPage: ${quantityPage},
wordSelected: ${wordSelected},
isActiveButtonBack: ${isActiveButtonBack},
isActiveButtonNext: ${isActiveButtonNext},
isExecution: ${isExecution},
isSuccess: ${isSuccess}
    ''';
  }
}
