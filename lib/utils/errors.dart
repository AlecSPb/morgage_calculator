import 'package:meta/meta.dart';

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = "Ошибка сети"]);
}

class ConnectException extends NetworkException {}

class ApiException extends NetworkException {
  final String message;
  ApiException({@required this.message}) : super(message);
  String toString() => "Ошибка:$message}";
}

abstract class ShowException implements Exception {
  final String message;
  ShowException(this.message);
}

///Исключение - маркер для прокидывания в UI диалога с
///описанием ошибки
class DialogShowExceptiton extends ShowException {
  DialogShowExceptiton(String message) : super(message);

  @override
  String toString() => 'DialogShowExceptiton: $message';
}

///Исключение - маркер для прокидывания в UI снек бара с
///описанием ошибки
class SnackBarShowException extends ShowException {
  SnackBarShowException(String message) : super(message);

  @override
  String toString() => 'ShackBarShowException: $message';
}
