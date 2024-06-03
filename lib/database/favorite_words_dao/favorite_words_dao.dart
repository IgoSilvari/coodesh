import 'package:coodesh/database/database.dart';
import 'package:coodesh/helper/status_loading.dart';
import 'package:coodesh/model/favorite_word_model.dart';

class FavoriteWordDao {
  static const String tableSql = '''CREATE TABLE $_tableName(
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_word TEXT,
      $_isFavorite INTEGER)''';

  static const String _tableName = 'favoriteTable';
  static const String _id = 'id';
  static const String _word = 'word';
  static const String _isFavorite = 'isFavorite';

  Future<StatusLoad> save(FavoriteWordModel favoriteModel) async {
    final dataBase = await getDatabase();
    final statusCode = await dataBase.insert(_tableName, toMap(favoriteModel));
    if (statusCode == 0) {
      return StatusLoad.failed;
    } else {
      return StatusLoad.success;
    }
  }

  Map<String, dynamic> toMap(FavoriteWordModel favoriteModel) {
    final newMap = <String, dynamic>{};
    newMap[_id] = favoriteModel.id;
    newMap[_word] = favoriteModel.word;
    newMap[_isFavorite] = (favoriteModel.isFavorite ?? false) ? 1 : 0;
    return newMap;
  }

  Future<List<FavoriteWordModel>> findAll() async {
    final dataBase = await getDatabase();
    final List<Map<String, dynamic>> result;
    result = await dataBase.query(_tableName);
    return toList(result);
  }

  List<FavoriteWordModel> toList(List<Map<String, dynamic>> listMap) {
    final List<FavoriteWordModel> favoriteList = [];
    for (final line in listMap) {
      final favoriteModel = FavoriteWordModel(
        id: line[_id],
        word: line[_word],
        isFavorite: line[_isFavorite] == 1 ? true : false,
      );
      favoriteList.add(favoriteModel);
    }
    return favoriteList;
  }

  Future<FavoriteWordModel> getFavorite(String word) async {
    final allFavorite = await findAll();
    final favorite = allFavorite.firstWhere(
      (element) => element.word == word,
      orElse: () => FavoriteWordModel(),
    );
    return favorite;
  }

  Future<StatusLoad> updateFavorite(
      {required FavoriteWordModel favorite}) async {
    final dataBase = await getDatabase();
    final int updatedQuantity = await dataBase.rawUpdate(
      'UPDATE $_tableName SET $_isFavorite = ? WHERE $_word = "${favorite.word}"',
      [
        (favorite.isFavorite ?? false) ? 0 : 1,
      ],
    );
    if (updatedQuantity >= 1) {
      return StatusLoad.success;
    } else {
      return StatusLoad.failed;
    }
  }

  Future<StatusLoad> saveOrUpdateFavorite(String word) async {
    final favorite = await getFavorite(word);

    if (favorite.word == null) {
      return save(
        FavoriteWordModel(
          word: word,
          isFavorite: true,
        ),
      );
    } else {
      return updateFavorite(favorite: favorite);
    }
  }
}
