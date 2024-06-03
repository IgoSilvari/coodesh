import 'package:coodesh/database/favorite_words_dao/favorite_words_dao.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/favorite_word_model.dart';
import 'package:mobx/mobx.dart';

part 'favorite_word_store.g.dart';

class FavoriteWordStore = FavoriteWordStoreBase with _$FavoriteWordStore;

abstract class FavoriteWordStoreBase with Store {
  @observable
  StatusLoad statusLoad = StatusLoad.none;

  @computed
  bool get isNone => statusLoad == StatusLoad.executing;

  @computed
  bool get isExecution => statusLoad == StatusLoad.executing;

  @computed
  bool get isSuccess => statusLoad == StatusLoad.success;

  @computed
  bool get isFail => !isExecution && !isSuccess && !isNone;

  @observable
  bool isFavorite = false;

  @observable
  String wordFavorite = '';

  @action
  Future<StatusLoad> favorite() async {
    statusLoad = StatusLoad.executing;
    isFavorite = !isFavorite;
    statusLoad = await FavoriteWordDao().saveOrUpdateFavorite(wordFavorite);
    if (statusLoad == StatusLoad.failed) {
      isFavorite = !isFavorite;
    }
    return statusLoad;
  }

  @action
  Future<StatusLoad> checkFavorite({required String word}) async {
    statusLoad = StatusLoad.executing;
    isFavorite = false;
    wordFavorite = word;
    final favorite = await FavoriteWordDao().getFavorite(word);
    isFavorite = favorite.isFavorite ?? false;
    statusLoad = StatusLoad.success;
    return statusLoad;
  }

  ObservableList<FavoriteWordModel> favoriteList = ObservableList.of([]);

  @action
  Future<StatusLoad> getFavorites() async {
    statusLoad = StatusLoad.executing;
    final favorites = await FavoriteWordDao().findAll();
    for (final element in favorites) {
      favoriteList.add(element);
    }
    statusLoad = StatusLoad.success;
    return statusLoad;
  }
}
