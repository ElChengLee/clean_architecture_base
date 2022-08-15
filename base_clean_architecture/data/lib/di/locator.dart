import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../common/constants.dart';
import '../datasource/local/dao/article_dao.dart';
import '../datasource/local/db/app_database.dart';
import '../datasource/remote/service/login/login_service.dart';
import 'locator.config.dart';

final locator = GetIt.instance..allowReassignment = true;

String token = "";
String langApp = RequestHeaderValue.langVi;

@injectableInit
void setupLocator() {
  _init(locator);
  $initGetIt(locator);
}

void _init(GetIt locator) {
  _registerNetworkModules(locator);
  _registerServices(locator);
  _registerDatabase(locator);
}

void _registerNetworkModules(GetIt locator) {
  Dio dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  dioAdapter.onPost(
      "/authenticate/1.0",
      (server) => {
            server.reply(
              HttpStatus.ok,
              {
                "requestId": "",
                "status": "0",
                "desc": "SUCCESS",
                "message": null,
                "data": {"token": "Token data"}
              },
              // Reply would wait for one-sec before returning data.
              delay: const Duration(seconds: 1),
            )
          },
      data: Matchers.any);
  dio.options = BaseOptions(
    baseUrl: Constants.baseUrl,
    contentType: NetworkRequestValues.contentType,
    sendTimeout: Constants.timeOut,
    connectTimeout: Constants.timeOut,
    receiveTimeout: Constants.timeOut,
  );
  dio.interceptors.add(addInterceptor());
  locator.registerSingleton<Dio>(dio);
}

InterceptorsWrapper addInterceptor() {
  final _logger = Logger();
  return InterceptorsWrapper(onRequest: (_option, _handler) {
    _option.headers = {
      RequestHeader.tokenKey: token,
      RequestHeader.language: langApp
    };
    _logger.d("Request:");
    _logger.d("Log Url request: ${_option.baseUrl}");
    _logger.d("Log header request: ${_option.headers.toString()}");
    _handler.next(_option);
  }, onResponse: (_response, _handler) {
    _logger.d(
        "Response: ${_response.data?.toString() ?? _response.statusCode ?? "logResponseInterceptor empty"}");
    _handler.next(_response);
  }, onError: (_error, _handler) {
    _logger.d("Error: ${_error.error?.toString()}");
  });
}

void _registerServices(GetIt locator) {
  locator
      .registerLazySingleton<LoginService>(() => LoginService(locator<Dio>()));
}

void _registerDatabase(GetIt locator) async {
  final database =
  await $FloorAppDatabase.databaseBuilder("article_database.db").build();
  locator.registerLazySingleton<AppDatabase>(() => database);
  locator.registerLazySingleton<ArticleDao>(
          () => locator.get<AppDatabase>().articleDao);
}