import 'package:floor/floor.dart';

import '../entity/article_entity.dart';

const _tableName = 'ArticleEntity';

@dao
abstract class ArticleDao {
  @Query('select * FROM $_tableName')
  Future<List<ArticleEntity>> getArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveArticles(List<ArticleEntity> articles);

  @Query('select * from $_tableName where id = :id')
  Future<ArticleEntity?> getArticleById(int id);
}
