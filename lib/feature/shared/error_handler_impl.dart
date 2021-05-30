import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../../core/domain/error/app_error.dart';
import '../../core/domain/usecase/custom_error.dart';
import '../../core/domain/usecase/error_handler.dart';

import 'data/entity/error_response_model.dart';

class ErrorHandlerImpl implements ErrorHandler {
  final Logger logger;

  ErrorHandlerImpl(this.logger);

  @override
  CustomError formatError(dynamic error, StackTrace stackTrace) {
    logger.e('${error.toString()}\n$stackTrace');
    if (error is CustomError) {
      return error;
    }
    else if(error is DioError){
      final model = ErrorResponseModel.fromJson(error.response.data);
      switch(model.status){
        case 404:
          return AppError.notFoundException(
            code: model.status,
            title: model.name,
            message: model.message
          );
      }
    }
    return AppError.unhandledException(message: error.toString());
  }
}
