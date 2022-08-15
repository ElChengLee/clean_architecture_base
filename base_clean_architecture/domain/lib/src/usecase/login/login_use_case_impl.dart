import 'package:domain/src/common/result.dart';
import 'package:domain/src/model/domain_model.dart';
import 'package:domain/src/repository/login_repository.dart';
import 'package:domain/src/usecase/login/login_use_case.dart';
import 'package:injectable/injectable.dart';

/// implementation of use cases
@Injectable(as: LoginUseCase)
class LoginUseCaseImpl extends LoginUseCase {
  final LoginRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<Result<LoginModel>> performLogin(LoginRequestModel model) {
    return _repository.performLogin(model);
  }

}
