// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_word_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteWordStore on FavoriteWordStoreBase, Store {
  Computed<bool>? _$isNoneComputed;

  @override
  bool get isNone => (_$isNoneComputed ??= Computed<bool>(() => super.isNone,
          name: 'FavoriteWordStoreBase.isNone'))
      .value;
  Computed<bool>? _$isExecutionComputed;

  @override
  bool get isExecution =>
      (_$isExecutionComputed ??= Computed<bool>(() => super.isExecution,
              name: 'FavoriteWordStoreBase.isExecution'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'FavoriteWordStoreBase.isSuccess'))
          .value;
  Computed<bool>? _$isFailComputed;

  @override
  bool get isFail => (_$isFailComputed ??= Computed<bool>(() => super.isFail,
          name: 'FavoriteWordStoreBase.isFail'))
      .value;

  late final _$statusLoadAtom =
      Atom(name: 'FavoriteWordStoreBase.statusLoad', context: context);

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

  late final _$isFavoriteAtom =
      Atom(name: 'FavoriteWordStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$wordFavoriteAtom =
      Atom(name: 'FavoriteWordStoreBase.wordFavorite', context: context);

  @override
  String get wordFavorite {
    _$wordFavoriteAtom.reportRead();
    return super.wordFavorite;
  }

  @override
  set wordFavorite(String value) {
    _$wordFavoriteAtom.reportWrite(value, super.wordFavorite, () {
      super.wordFavorite = value;
    });
  }

  late final _$favoriteAsyncAction =
      AsyncAction('FavoriteWordStoreBase.favorite', context: context);

  @override
  Future<StatusLoad> favorite() {
    return _$favoriteAsyncAction.run(() => super.favorite());
  }

  late final _$checkFavoriteAsyncAction =
      AsyncAction('FavoriteWordStoreBase.checkFavorite', context: context);

  @override
  Future<StatusLoad> checkFavorite({required String word}) {
    return _$checkFavoriteAsyncAction
        .run(() => super.checkFavorite(word: word));
  }

  @override
  String toString() {
    return '''
statusLoad: ${statusLoad},
isFavorite: ${isFavorite},
wordFavorite: ${wordFavorite},
isNone: ${isNone},
isExecution: ${isExecution},
isSuccess: ${isSuccess},
isFail: ${isFail}
    ''';
  }
}
