import 'package:data/datasource/remote/dto/login/login_response.dart';
import 'package:data/datasource/remote/service/login/login_service.dart';
import 'package:data/mapper/login_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../datasource/remote/dto/model_base_response.dart';
import 'base/base_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends BaseRepository implements LoginRepository {
  final LoginService _loginService;

  LoginRepositoryImpl(this._loginService);

  @override
  Future<Result<LoginModel>> performLogin(LoginRequestModel model) {
    return safeApiCall(_loginService.performLogin(model.toModel()),
        mapper: (LoginResponse? response) => response?.toModel());
  }
}
