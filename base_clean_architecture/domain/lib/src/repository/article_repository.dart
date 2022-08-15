import '../../domain.dart';

abstract class ArticleRepository {
  Future<Result<List<ArticleModel>>>? getArticles();

  Future<Result<ArticleModel>> getArticle(int id);
}
