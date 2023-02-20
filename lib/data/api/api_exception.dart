abstract class ApiException implements Exception {
  final String? prefix;
  final String? message;

  ApiException({this.prefix, this.message});

  @override
  String toString() {
    return "$prefix $message";
  }
}

class NetworkException extends ApiException {
  final String? message;
  NetworkException({this.message}) : super(prefix : "Network error: ", message: "$message");
}

class ErrorRequestException extends ApiException {
  dynamic errorCode;
  dynamic errorBody;

  ErrorRequestException({this.errorCode, this.errorBody}) : super(
      prefix: "Error code : $errorCode",
      message: "\n$errorBody"
  );
}

class UnauthorizedException extends ApiException {
  final String errorBody;

  UnauthorizedException({
    required this.errorBody,
  }) : super(
    prefix: "Unauthorized",
    message: errorBody,
  );
}