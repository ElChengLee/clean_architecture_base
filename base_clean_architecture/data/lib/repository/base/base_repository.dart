import 'package:data/datasource/remote/dto/model_base_response.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:logger/logger.dart';

typedef ResponseToModelMapper<Data, Model> = Model? Function(Data? data);
typedef EntityToModelMapper<Entity, Model> = Model? Function(Entity? entity);
typedef SaveResult<Data> = Future Function(Data? data);

abstract class BaseRepository {
  final _logger = Logger();

  Future<Result<Model>> safeDbCall<Entity, Model>(Future<Entity?> call,
      {required EntityToModelMapper<Entity, Model> mapper}) async {
    try {
      final response = await call;
      if (response != null) {
        _logger.d("DB success message -> $response");
        return Success(mapper.call(response)!);
      } else {
        _logger.d("DB response is null");
        return Error(ErrorType.GENERIC, "DB response is null!");
      }
    } catch (exception) {
      _logger.d("DB failure message -> $exception");
      return Error(ErrorType.GENERIC, "Unknown DB error");
    }
  }

  Future<Result<Model>> safeApiCall<Data, Model>(
      Future<ModelBaseResponse<Data>> call,
      {required ResponseToModelMapper<Data, Model> mapper,
      SaveResult<Data?>? saveResult}) async {
    try {
      var response = await call;
      if (response.isSuccess()) {
        await saveResult?.call(response.data);
        return Success(mapper.call(response.data));
      } else {
        return Error(ErrorType.GENERIC, response.message ?? "Lỗi không xác định");
      }
    } on Exception catch (exception) {
      _logger.e("Api error message -> ${exception.toString()}");
      _logger.e(exception);
      if (exception is DioError) {
        switch (exception.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.cancel:
            return Error(ErrorType.POOR_NETWORK, exception.message);

          case DioErrorType.other:
            return Error(ErrorType.NO_NETWORK, exception.message);

          case DioErrorType.response:
            return Error(ErrorType.GENERIC, exception.message);
        }
      }
      return Error(ErrorType.GENERIC, "Unknown API error");
    }
  }
}
