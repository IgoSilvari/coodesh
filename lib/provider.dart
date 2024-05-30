import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:provider/provider.dart';

List<Provider> listProviders() {
  return [
    Provider<DataUserLoggedStore>(create: (_) => DataUserLoggedStore()),
  ];
}
