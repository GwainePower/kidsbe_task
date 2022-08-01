import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/models/article.dart';

class DbService {
  static Database? _database;
  static final DbService db = DbService._();

  DbService._();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'all_articles.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Articles('
          'slug_name TEXT PRIMARY KEY,'
          'section TEXT,'
          'title TEXT,'
          'abstract TEXT,'
          'url TEXT,'
          'byline TEXT,'
          'thumbnail_standard TEXT,'
          'published_date TEXT'
          ')');
    });
  }

  insertArticles(List<Article> articles) async {
    final db = await database;
    Batch batch = db!.batch();
    for (var article in articles) {
      batch.insert(
        'Articles',
        article.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    batch.commit();
  }

  deleteAllArticles() async {
    final db = await database;
    await db!.delete('Articles');
  }

  Future<List<Article>> getArticlesWhere({required String section}) async {
    final db = await database;
    final queryResult = section == 'all'
        ? await db!.query('Articles')
        : await db!.query(
            'Articles',
            where: 'section = ?',
            whereArgs: [section],
          );
    List<Article> articlesList = queryResult.isNotEmpty
        ? queryResult.map((article) => Article.fromMap(article)).toList()
        : [];
    return articlesList;
  }
}
