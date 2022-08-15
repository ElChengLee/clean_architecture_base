import 'package:domain/domain.dart';
import 'package:domain/src/usecase/base/base_use_case.dart';

/// abstraction of use case to be used by viewmodel
abstract class LoginUseCase implements BaseUseCase {
  Future<Result<LoginModel>> performLogin(LoginRequestModel model);
}
