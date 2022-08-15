import 'package:domain/domain.dart';

abstract class LoginRepository {
  Future<Result<LoginModel>> performLogin(LoginRequestModel model);
}
