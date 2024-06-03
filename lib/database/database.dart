import 'package:coodesh/database/favorite_words_dao/favorite_words_dao.dart';
import 'package:coodesh/database/user_dao/user_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'coodesh.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UserDao.tableSql);
      db.execute(FavoriteWordDao.tableSql);
    },
    version: 1,
  );
}
