import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:user_list/tomodel.dart';

class DatabaseService {
  Future<Database> initData() async {
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, 'demo.db');
    return openDatabase(path, version: 1, onCreate: oncreate);
  }

  Future<void> oncreate(Database database, int version) async {
    await database.execute(
        "CREATE TABLE IF NOT EXISTS list(id INTEGER PRIMARY KEY, username TEXT, phonenumber TEXT, password TEXT)");
  }

  Future<void> createlist(Usermodels usermodels) async {
    var db = await initData();
    int result = await db.insert("list", usermodels.toMap());
    print(result);
  }

  Future<List<Usermodels>> readlist() async {
    var db = await initData();
    var data = await db.query('list');
    return userfromMap(data);
  }

  Future<void> updatelist(Usermodels usermodels, int id) async {
    var db = await initData();
    int result = await db.update("list", usermodels.toMap(), where: "id=$id");
    print(result);
  }

  Future<void> deletelist(int id) async {
    var db = await initData();
    var data = await db.delete('list', where: 'id=$id');
    print(data);
  }
}
