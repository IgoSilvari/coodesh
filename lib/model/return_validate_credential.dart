import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';

class DataValidateCredential {
  bool? isRegistered;
  UserModel? user;
  StatusLoad? statusLoad;

  DataValidateCredential({this.user, this.isRegistered, this.statusLoad});
}
