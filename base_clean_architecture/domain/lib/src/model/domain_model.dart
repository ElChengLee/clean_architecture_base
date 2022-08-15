class ArticleModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String articleUrl;
  final String date;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.articleUrl,
      required this.date});
}

class LoginModel {
  final String? token;

  LoginModel({this.token});
}

class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({required this.username, required this.password});
}
