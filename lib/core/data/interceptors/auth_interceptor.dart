import 'package:dio/dio.dart';
import 'package:football_matches/core/data/data_constants.dart';

class AuthInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers={DataConstants.tokenKey : DataConstants.tokenValue};
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.error);
  //  print(err.requestOptions);
    handler.next(err);
  }
}