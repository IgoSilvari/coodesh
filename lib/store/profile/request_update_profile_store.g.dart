// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_update_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RequestUpdateProfileStore on RequestUpdateProfileStoreBase, Store {
  Computed<bool>? _$isExecutionComputed;

  @override
  bool get isExecution =>
      (_$isExecutionComputed ??= Computed<bool>(() => super.isExecution,
              name: 'RequestUpdateProfileStoreBase.isExecution'))
          .value;
  Computed<bool>? _$isSuccessComputed;

  @override
  bool get isSuccess =>
      (_$isSuccessComputed ??= Computed<bool>(() => super.isSuccess,
              name: 'RequestUpdateProfileStoreBase.isSuccess'))
          .value;
  Computed<bool>? _$isFailComputed;

  @override
  bool get isFail => (_$isFailComputed ??= Computed<bool>(() => super.isFail,
          name: 'RequestUpdateProfileStoreBase.isFail'))
      .value;

  late final _$statusLoadAtom =
      Atom(name: 'RequestUpdateProfileStoreBase.statusLoad', context: context);

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

  late final _$updateAddressAsyncAction = AsyncAction(
      'RequestUpdateProfileStoreBase.updateAddress',
      context: context);

  @override
  Future<StatusLoad> updateAddress({required UserModel user}) {
    return _$updateAddressAsyncAction
        .run(() => super.updateAddress(user: user));
  }

  late final _$updateUserDataAsyncAction = AsyncAction(
      'RequestUpdateProfileStoreBase.updateUserData',
      context: context);

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
