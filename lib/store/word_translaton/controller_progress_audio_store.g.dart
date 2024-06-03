// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_progress_audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ControllerProgressAudioStore
    on ControllerProgressAudioStoreBase, Store {
  Computed<int>? _$lengTextComputed;

  @override
  int get lengText =>
      (_$lengTextComputed ??= Computed<int>(() => super.lengText,
              name: 'ControllerProgressAudioStoreBase.lengText'))
          .value;
  Computed<double>? _$valueProgressComputed;

  @override
  double get valueProgress =>
      (_$valueProgressComputed ??= Computed<double>(() => super.valueProgress,
              name: 'ControllerProgressAudioStoreBase.valueProgress'))
          .value;

  late final _$textTranslationAtom = Atom(
      name: 'ControllerProgressAudioStoreBase.textTranslation',
      context: context);

  @override
  String get textTranslation {
    _$textTranslationAtom.reportRead();
    return super.textTranslation;
  }

  @override
  set textTranslation(String value) {
    _$textTranslationAtom.reportWrite(value, super.textTranslation, () {
      super.textTranslation = value;
    });
  }

  late final _$endOffsetAtom = Atom(
      name: 'ControllerProgressAudioStoreBase.endOffset', context: context);

  @override
  int get endOffset {
    _$endOffsetAtom.reportRead();
    return super.endOffset;
  }

  @override
  set endOffset(int value) {
    _$endOffsetAtom.reportWrite(value, super.endOffset, () {
      super.endOffset = value;
    });
  }

  late final _$isPlayAtom =
      Atom(name: 'ControllerProgressAudioStoreBase.isPlay', context: context);

  @override
  bool get isPlay {
    _$isPlayAtom.reportRead();
    return super.isPlay;
  }

  @override
  set isPlay(bool value) {
    _$isPlayAtom.reportWrite(value, super.isPlay, () {
      super.isPlay = value;
    });
  }

  late final _$isPauseAtom =
      Atom(name: 'ControllerProgressAudioStoreBase.isPause', context: context);

  @override
  bool get isPause {
    _$isPauseAtom.reportRead();
    return super.isPause;
  }

  @override
  set isPause(bool value) {
    _$isPauseAtom.reportWrite(value, super.isPause, () {
      super.isPause = value;
    });
  }

  late final _$isContinueAtom = Atom(
      name: 'ControllerProgressAudioStoreBase.isContinue', context: context);

  @override
  bool get isContinue {
    _$isContinueAtom.reportRead();
    return super.isContinue;
  }

  @override
  set isContinue(bool value) {
    _$isContinueAtom.reportWrite(value, super.isContinue, () {
      super.isContinue = value;
    });
  }

  late final _$ControllerProgressAudioStoreBaseActionController =
      ActionController(
          name: 'ControllerProgressAudioStoreBase', context: context);

  @override
  void changeText(String value) {
    final _$actionInfo = _$ControllerProgressAudioStoreBaseActionController
        .startAction(name: 'ControllerProgressAudioStoreBase.changeText');
    try {
      return super.changeText(value);
    } finally {
      _$ControllerProgressAudioStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeEndOffset(int value) {
    final _$actionInfo = _$ControllerProgressAudioStoreBaseActionController
        .startAction(name: 'ControllerProgressAudioStoreBase.changeEndOffset');
    try {
      return super.changeEndOffset(value);
    } finally {
      _$ControllerProgressAudioStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void cleanData() {
    final _$actionInfo = _$ControllerProgressAudioStoreBaseActionController
        .startAction(name: 'ControllerProgressAudioStoreBase.cleanData');
    try {
      return super.cleanData();
    } finally {
      _$ControllerProgressAudioStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeProgressAudio(StateProgress state) {
    final _$actionInfo =
        _$ControllerProgressAudioStoreBaseActionController.startAction(
            name: 'ControllerProgressAudioStoreBase.changeProgressAudio');
    try {
      return super.changeProgressAudio(state);
    } finally {
      _$ControllerProgressAudioStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textTranslation: ${textTranslation},
endOffset: ${endOffset},
isPlay: ${isPlay},
isPause: ${isPause},
isContinue: ${isContinue},
lengText: ${lengText},
valueProgress: ${valueProgress}
    ''';
  }
}
