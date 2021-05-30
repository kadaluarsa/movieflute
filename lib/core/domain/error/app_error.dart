
import 'package:movieappget/core/domain/usecase/custom_error.dart';

const String defaultErrorTitle = 'Terjadi kesalahan pada aplikasi';
const String defaultErrorMessage = 'Aplikasi mengalami masalah';

class AppError implements CustomError {
  AppError._(this.title, this.message);

  factory AppError.unhandledException({String title, String message}) =
  UnhandledException;
  factory AppError.notFoundException({int code, String title, String message})
    = NotFoundException;

  @override
  // this is to understand original error message only
  StackTrace get stackTrace => StackTrace.fromString(message);

  final String title;
  final String message;

  String get formattedTitle => title;

  String get formattedMessage => message;
}

class UnhandledException extends AppError {
  UnhandledException({this.title, this.message}) : super._(title, message);
  @override
  final String title;
  @override
  final String message;

  @override
  String get formattedTitle => title ?? defaultErrorTitle;

  @override
  String get formattedMessage => defaultErrorMessage;
}

class NotFoundException extends AppError {
  NotFoundException({int code, this.title, this.message}) 
    : _code = code, super._(title, message);
    
  final int _code;
  @override
  final String title;
  @override
  final String message;

  int get code => _code;

  @override
  String get formattedTitle => title ?? defaultErrorTitle;

  @override
  String get formattedMessage => defaultErrorMessage;
}