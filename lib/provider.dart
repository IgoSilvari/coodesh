import 'package:coodesh/store/data_user_logged_store.dart';
import 'package:coodesh/store/history/controller_history_store.dart';
import 'package:coodesh/store/home/controller_dictionary_store.dart';
import 'package:provider/provider.dart';

List<Provider> listProviders() {
  return [
    Provider<DataUserLoggedStore>(create: (_) => DataUserLoggedStore()),
    Provider<ControllerDictionaryStore>(
      create: (_) => ControllerDictionaryStore(),
    ),
    Provider<ControllerHistoryStore>(create: (_) => ControllerHistoryStore()),
  ];
}
