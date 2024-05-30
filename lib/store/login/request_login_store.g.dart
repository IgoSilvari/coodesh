// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RequestLoginStore on RequestLoginStoreBase, Store {
  Computed<bool>? _$isExecutionComputed;

  @override
  bool get isExecution =>
      (_$isExecutionComputed ??= Computed<bool>(() => super.isExecution,
              name: 'RequestLoginStoreBase.isExecution'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'RequestLoginStoreBase.isSuccess'))
          .value;
  Computed<bool>? _$isFailComputed;

  @override
  bool get isFail => (_$isFailComputed ??= Computed<bool>(() => super.isFail,
          name: 'RequestLoginStoreBase.isFail'))
      .value;

  late final _$statusLoadAtom =
      Atom(name: 'RequestLoginStoreBase.statusLoad', context: context);

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

  late final _$loginAsyncAction =
      AsyncAction('RequestLoginStoreBase.login', context: context);

  @override
  Future<DataValidateCredential> login(
      {required String email, required String password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  late final _$updateUserDataAsyncAction =
      AsyncAction('RequestLoginStoreBase.updateUserData', context: context);

  @override
  Future<void> updateUserData(UserModel? user) {
    return _$updateUserDataAsyncAction.run(() => super.updateUserData(user));
  }

  @override
  String toString() {
    return '''
statusLoad: ${statusLoad},
isExecution: ${isExecution},
isSuccess: ${isSuccess},
isFail: ${isFail}
    ''';
  }
}
