import '../common/result.dart';
import '../model/domain_model.dart';
import 'base/base_use_case.dart';

/// abstraction of use case to be used by viewmodel
abstract class GetAllArticleUseCase implements BaseUseCase {
  Future<Result<List<ArticleModel>>>? getArticles();
}

/// abstraction of use case to be used by viewmodel
abstract class GetArticleByIdUseCase implements BaseUseCase {
  Future<Result<ArticleModel>> getArticle(int id);
}
