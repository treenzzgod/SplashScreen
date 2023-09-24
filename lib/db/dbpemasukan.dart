import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/pemasukan.dart';

class DbPemasukan {
  static DbPemasukan dbpemasukan;
  Database database;
  DbPemasukan._createobject();

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'pemasukan.db');
    var dbpemasukan = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbpemasukan;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''CREATE TABLE pemasukan(
      id INTEGER PRIMARY KEY,
      date Datetime,
      description TEXT,
      amount INTEGER
    )''');
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await initDb();
    var maplist = await db.query('pemasukan', orderBy: 'id');
    return maplist;
  }

  Future<int> insert(Pemasukan object) async {
    Database db = await initDb();
    int count = await db.insert('pemasukan', object.toMap());
    return count;
  }

  Future<int> update(Pemasukan object) async {
    Database db = await initDb();
    int count = await db.update('pemasukan', object.toMap(),
        where: 'id = ?', whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await initDb();
    int count = await db.delete('pemasukan', where: 'id = ?', whereArgs: [id]);
    return count;
  }

  Future<List<Pemasukan>> getPemasukan() async {
    var pemasukanMapList = await select();
    int count = pemasukanMapList.length;
    List<Pemasukan> pemasukanList = <Pemasukan>[];
    for (int i = 0; i < count; i++) {
      pemasukanList.add(Pemasukan.fromMap(pemasukanMapList[i]));
    }
    return pemasukanList;
  }

  factory DbPemasukan() {
    if (dbpemasukan == null) {
      dbpemasukan = DbPemasukan._createobject();
    }
    return DbPemasukan();
  }
  Future<Database> get db async {
    if (database == null) {
      database = await initDb();
    }
    return database;
  }

  Future<Object> totalpemasukan() async {
    Database db = await initDb();
    var result = await db.rawQuery('SELECT SUM(amount) FROM pemasukan');

    if (result.length > 0) {
      return result[0]['sum(amount) '];
    } else {
      return 0;
    }
  }
}
