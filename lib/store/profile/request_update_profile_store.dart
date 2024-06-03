import 'package:coodesh/database/user_dao/user_dao.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';
import 'package:coodesh/router.dart';
import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'request_update_profile_store.g.dart';

class RequestUpdateProfileStore = RequestUpdateProfileStoreBase
    with _$RequestUpdateProfileStore;

abstract class RequestUpdateProfileStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail =>
      !isExecution && !isSuccess && statusLoad != StatusLoad.none;

  @action
  Future<StatusLoad> updateProfile({required UserModel user}) async {
    statusLoad = StatusLoad.executing;
    await Future.delayed(const Duration(milliseconds: 500));
    statusLoad = await UserDao().updateDataUser(user: user);
    if (statusLoad == StatusLoad.success) {
      updateUserData(user);
    }
    return statusLoad;
  }

  @action
  void updateUserData(UserModel? user) {
    final context = AppRouter.navigatorKey.currentContext;
    Provider.of<DataUserLoggedStore>(context!, listen: false).changeUser(user);
  }
}
