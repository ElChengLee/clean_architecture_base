import 'package:data/common/constants.dart';
import 'package:data/datasource/remote/dto/login/login_request.dart';
import 'package:data/datasource/remote/dto/login/login_response.dart';
import 'package:data/datasource/remote/dto/model_base_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST('/authenticate' + Constants.version)
  Future<ModelBaseResponse<LoginResponse>> performLogin(@Body() LoginRequest model);
}
