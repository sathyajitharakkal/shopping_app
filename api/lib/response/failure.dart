part of api;

@immutable
class ResponseFailure implements Exception {
  const ResponseFailure._({
    this.errorCode,
    required this.errorMessage,
  });

  final int? errorCode;
  final String errorMessage;
}