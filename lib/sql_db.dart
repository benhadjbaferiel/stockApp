import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:stock_dz_app/Models/fournisseure_model.dart';

class SqlDb {
  static Database? _db;
  SqlDb._privateConstructor();
  static final SqlDb instance = SqlDb._privateConstructor();
  Future<Database> get db async {
    if (_db == null) {
      // Initialize the database if it's null
      _db = await intialDb();
    }
    return _db!;
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

  Future<int> delete(
      String table, String whereClause, List<dynamic> whereArgs) async {
    try {
      final db = await intialDb(); // Ensure the database is initialized
      return await db.delete(table, where: whereClause, whereArgs: whereArgs);
    } catch (e) {
      print('Error executing delete on $table: $e');
      return 0;
    }
  }

  //---------------------------------------
  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'stock.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    if (oldversion < 5) {}
    print("New tables added successfully in version upgrade");
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "packs"(
  "idpack" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "packName" TEXT NOT NULL UNIQUE,
  "packprice" REAL NOT NULL ,
    "packquantity" INTEGER NOT NULL
)
''');
    await db.execute('''
CREATE TABLE "categoryP"(
  "id8" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "categoryPName" TEXT NOT NULL UNIQUE
  
)
''');
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
    "notify" INTEGER NOT NULL , 
    "description" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "date" TEXT NOT NULL ,
    "image_path" TEXT,
    "idP" INTEGER NOT NULL,
    FOREIGN KEY ("idP") REFERENCES "categoryP" ("id8") ON DELETE CASCADE
    )
''');

    await db.execute('''
CREATE TABLE "categoryC"(
  "id3" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  "categoryName" TEXT NOT NULL UNIQUE
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
    "DAYS" TEXT NOT NULL,
    "idC" INTEGER NOT NULL,
    FOREIGN KEY ("idC") REFERENCES "categoryC" ("id3") ON DELETE CASCADE
    )
''');
    await db.execute('''
      CREATE TABLE IF NOT EXISTS "fournisseure_category" (
        "idF" INTEGER PRIMARY KEY AUTOINCREMENT,
        "categoryNameSuppliers" TEXT NOT NULL UNIQUE
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

    print("create  database and tables -------------------");
  }

  Future<List<Map<String, dynamic>>> rawQuery1(String sql,
      [List<dynamic>? arguments]) async {
    final dbClient = await db;
    return await dbClient.rawQuery(sql, arguments);
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

  Future<void> insertClient(Map<String, dynamic> clientData) async {
    final dtb = await db;
    await dtb.insert('clients', clientData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertCategotyP(Map<String, dynamic> categotyPData) async {
    final dtb = await db;
    await dtb.insert('CategoryP', categotyPData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertProduct(Map<String, dynamic> produitData) async {
    final dtb = await db;
    await dtb.insert('produits', produitData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
