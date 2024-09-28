import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'stock.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgradee------------------");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE "produits"(
    "id"  INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL ,
    "name" TEXT NOT NULL ,
    "prix1" REAL NOT NULL ,
    "prix2" REAL NOT NULL ,
    "prix3" REAL NOT NULL ,
    "prix4" REAL NOT NULL ,
    "prixachat" REAL NOT NULL ,
    "carton" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "category" TEXT NOT NULL ,
    "notify" INTEGER NOT NULL , 
    "description" TEXT NOT NULL,
    "date" TEXT NOT NULL ,
    "image_path" TEXT,
    )
''');
    await db.execute('''
    CREATE TABLE "clients"(
    "id1"  INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
    "Barcode" INTEGER NOT NULL ,
    "name" TEXT NOT NULL ,
    "Price" REAL NOT NULL ,
    "NIF" REAL NOT NULL ,
    "AI" REAL NOT NULL ,
    "RC" REAL NOT NULL ,
    "NIS" REAL NOT NULL ,
    "phoneNumber" INTEGER NOT NULL,
    "MAX" INTEGER NOT NULL,
    "address" TEXT NOT NULL ,
    "categorie" TEXT NOT NULL,
    "DAYS" TEXT NOT NULL,
    )
''');
    await db.execute('''
    CREATE TABLE "fournisseure"(
    "id2"  INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    "phoneNumberF" INTEGER NOT NULL ,
    "nameF" TEXT NOT NULL ,
    "NIFF" REAL NOT NULL ,
    "AIF" REAL NOT NULL ,
    "RCF" REAL NOT NULL ,
    "NISF" REAL NOT NULL ,
    "categorie1" TEXT NOT NULL ,
    "addressF" TEXT NOT NULL ,
    )
''');
    print("create  database and tables -------------------");
  }

// SELECT
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb.rawQuery(sql);
    return response;
  }

//DELETE
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb.rawDelete(sql);
    return response;
  }

// UPDATE
  UpdateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb.rawUpdate(sql);
    return response;
  }

// INSERT
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb.rawInsert(sql);
    return response;
  }
}
