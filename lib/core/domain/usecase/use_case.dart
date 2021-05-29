import 'error_handler.dart';

abstract class UseCase<Type, Param> {
  Future<Type> build(Param param);

  ErrorHandler errorHandler();

  Future<Type> execute(Param param) {
    return build(param).onError((error, stacktrace) {
      onError(error);
      throw errorHandler().formatError(error, stacktrace);
    });
  }

  // Make this empty body so that use case that doesn't need this callback
  // doesn't have to override
  void onError(dynamic error){}
}

class NoParam {
  List<Object> get props => [];
}