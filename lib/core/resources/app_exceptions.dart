class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  final String message;

  FetchDataException(this.message)
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  final String message;

  BadRequestException(this.message) : super(message, "Bad Request: ");
}

class UnauthorisedException extends AppException {
  final String message;

  UnauthorisedException(this.message) : super(message, "Unauthorised: ");
}

class InvalidInputException extends AppException {
  final String message;

  InvalidInputException(this.message) : super(message, "Invalid Input: ");
}

class InternetConnectionException extends AppException {
  InternetConnectionException() : super("", "No Internet Connection ");
}
