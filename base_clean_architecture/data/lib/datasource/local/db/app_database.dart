import 'dart:async';

import 'package:floor/floor.dart';

import '../dao/article_dao.dart';
import '../entity/article_entity.dart';

import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [ArticleEntity])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
