import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';

class SqlDb {
  static Database? _db;
  SqlDb._privateConstructor();
  static final SqlDb instance = SqlDb._privateConstructor();
  Future<Database> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  //---------------------------------------
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await intialDb();
    return _db!;
  }

  Future<List<Fournisseure>> getAllFournisseurs() async {
    Database mydb = await db;
    final List<Map<String, dynamic>> maps = await mydb.query('fournisseure');
    return List.generate(maps.length, (i) {
      return Fournisseure.fromMap(maps[i]);
    });
  }

  //---------------------------------------
  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'stock.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 5, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    if (oldversion < 5) {
      await db.execute('''
  CREATE TABLE IF NOT EXISTS "client_category" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "categoryNameClient" TEXT NOT NULL UNIQUE
  )
''');
    }
    print("New tables added successfully in version upgrade");
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
    "image_path" TEXT
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
    "DAYS" TEXT NOT NULL
    )
''');
    await db.execute('''
  CREATE TABLE "fournisseure" (
    "id2" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "phoneNumberF" INTEGER NOT NULL,
    "nameF" TEXT NOT NULL,
    "NIFF" REAL NOT NULL,
    "AIF" REAL NOT NULL,
    "RCF" REAL NOT NULL,
    "NISF" REAL NOT NULL,
    "categorie_id" INTEGER NOT NULL,
    "addressF" TEXT NOT NULL,
    FOREIGN KEY ("categorie_id") REFERENCES "fournisseure_category" ("idF") ON DELETE CASCADE
  )
  ''');

    await db.execute('''
CREATE TABLE "category"(
  "id3" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  categoryName TEXT NOT NULL UNIQUE
)
''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS "fournisseure_category" (
        "idF" INTEGER PRIMARY KEY AUTOINCREMENT,
        "categoryNameSuppliers" TEXT NOT NULL UNIQUE
      )
    ''');

    /*try {
      await db.execute('''
      INSERT INTO "fournisseure" 
      ("phoneNumberF", "nameF", "NIFF", "AIF", "RCF", "NISF", "categorie_id", "addressF")
      VALUES
      (123456789, 'Test Supplier', 987654321, 123456789, 123456789, 123456789, 1, 'Test Address');
    ''');
      print('Test fournisseur added successfully');
    } catch (e) {
      print('Error adding test fournisseur: $e');
    }*/

    print("create  database and tables -------------------");
  }

  Future<List<Map<String, dynamic>>> rawQuery(String sql) async {
    final dbClient = await db;
    return await dbClient.rawQuery(sql);
  }

  Future<List<Map<String, dynamic>>> readData(String sql,
      [List<dynamic>? arguments]) async {
    Database mydb = await db;
    if (arguments != null) {
      return await mydb.rawQuery(sql, arguments);
    }
    return await mydb.rawQuery(sql);
  }

  Future<int> deleteData(String sql, [List<dynamic>? arguments]) async {
    Database mydb = await db;
    return await mydb.rawDelete(sql, arguments);
  }

  Future<int> updateData(String sql, [List<dynamic>? arguments]) async {
    Database mydb = await db;
    return await mydb.rawUpdate(sql, arguments);
  }

  Future<int> insertData(String sql, List<dynamic> arguments) async {
    Database mydb = await db;
    return await mydb.rawInsert(sql, arguments);
  }

  Future<List<Map<String, dynamic>>> listTables() async {
    Database mydb = await db;
    return await mydb
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
  }

  Future<void> insertFournisseur(Map<String, dynamic> fournisseurData) async {
    final dtb = await db;
    await dtb.insert('fournisseure', fournisseurData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
