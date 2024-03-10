class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  toString() {
    return '$_message$_prefix';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, 'No Internet');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, 'Request Time Out');
}

class GeneralException extends AppException {
  GeneralException([String? message]) : super(message, 'General Exception');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Server Time Out');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error Fetching Data');
}
