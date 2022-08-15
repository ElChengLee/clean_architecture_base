import 'package:data/datasource/remote/dto/login/login_request.dart';
import 'package:data/datasource/remote/dto/login/login_response.dart';
import 'package:domain/domain.dart';

extension LoginExtension on LoginResponse {
  LoginModel toModel() => LoginModel(token: token);
}

extension LoginRequestExtension on LoginRequestModel {
  LoginRequest toModel() => LoginRequest(username, password);
}