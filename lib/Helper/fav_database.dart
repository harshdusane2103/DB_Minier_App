
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavouriteHelper
{
  static FavouriteHelper favouriteHelper = FavouriteHelper._();

  FavouriteHelper._();

  Database? _db;

  Future<Database?> get database async => _db ?? await favouriteDatabase();

  Future<Database?> favouriteDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'favouriteData.db');

    _db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        String sql = '''CREATE TABLE favouriteData(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          category TEXT,
          quote TEXT,
          author TEXT,
          isFavorite INTEGER
        );''';
        await db.execute(sql);
      },
    );
    return _db!;
  }

  Future<void> insertData(String category,String quote,String author,int isFavorite)
  async {
    Database? db = await database;
    String sql='''
    INSERT INTO favouriteData(category,quote,author,isFavorite) VALUES(?,?,?,?);
    ''';
    List args=[category,quote,author,isFavorite];
    await db!.rawInsert(sql,args);
  }

  Future<List<Map<String, Object?>>> readData() async {
    Database? db = await database;
    String sql = '''
    SELECT * FROM favouriteData;
    ''';
    return await db!.rawQuery(sql);
  }

  Future<List<Map<String, Object?>>> showCategoryWiseData(String category)
  async {
    Database? db = await database;
    String sql='''
    SELECT * FROM favouriteData WHERE category=?
    ''';
    List args=[category];
    return await db!.rawQuery(sql,args);
  }

  Future<void> deleteData(int id)
  async {
    Database? db=await database;
    String sql='''
    DELETE  FROM favouriteData WHERE id = ?;
    ''';
    List args=[id];
    await db!.rawDelete(sql,args);
  }

  Future<void> updateData(int isFavorite,int id)
  async {
    Database? db=await database;
    String sql='''
    UPDATE favouriteData
    SET like = ? 
    WHERE id = ?;
    ''';
    List args=[isFavorite,id];
    await db!.rawUpdate(sql,args);
  }

}