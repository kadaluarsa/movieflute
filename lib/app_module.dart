import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movieappget/core/domain/usecase/error_handler.dart';
import 'package:movieappget/feature/shared/data/datasource/movie_datasource_impl.dart';
import 'package:movieappget/feature/shared/data/repository/movie_repository_impl.dart';

import 'feature/shared/error_handler_impl.dart';

class ServerConfig {
  final String url;
  final int timeout;

  ServerConfig({this.url, this.timeout});
}

class MovieAppModule extends Bindings {
  @override
  void dependencies() {
    Get.put(Logger(
      printer: PrettyPrinter(methodCount: 0),
    ));
    Get.put(_getServerConfig('https://api.themoviedb.org/3/'));
    Get.put(_getDio(Get.find<ServerConfig>()));
    Get.put<ErrorHandler>(ErrorHandlerImpl(Get.find<Logger>()));
    Get.put(MovieDatasourceImpl(Get.find<Dio>()));
    Get.put(MovieRepositoryImlp(Get.find<MovieDatasourceImpl>()));
  }

  ServerConfig _getServerConfig(String _url) {
    return ServerConfig(url: _url, timeout: 3000);
  }

  Dio _getDio(ServerConfig server) {
    return Dio(BaseOptions(
      baseUrl: server.url,
      connectTimeout: server.timeout,
      receiveTimeout: server.timeout,
    ))
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // Do something before request is sent
        final baseUrl = options.uri;
        final path = options.path;
        Logger().d('Request [${baseUrl.toString() + path}] : '
            '${options.queryParameters.toString()}');
        Logger().d('header [${options.headers.toString()}] ');
        return handler.next(options); //continue
      }, onResponse: (response, handler) {
        // Do something with response data
        Logger().d('Response body: ${response.toString()}');
        return handler.next(response); // continue
      }, onError: (DioError e, handler) {
        Logger().d('Error body: ${e.error.toString()}');
        return handler.next(e); //continue
      }));
  }
}
