import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/user_model.dart';

class DataValidateCredentialModel {
  bool? isRegistered;
  UserModel? user;
  StatusLoad? statusLoad;

  DataValidateCredentialModel({this.user, this.isRegistered, this.statusLoad});
}
