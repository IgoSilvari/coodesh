import 'package:coodesh/database/user_dao/user_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'coodesh.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(UserDao.tableSql);
    },
    version: 1,
  );
}

Future<void> closeDataBase() async {
  final database = await getDatabase();
  if (database.isOpen) {
    await database.close();
  }
}

Future<void> deleteDataBase() async {
  final String path = join(await getDatabasesPath(), 'coodesh.db');
  await deleteDatabase(path);
}
