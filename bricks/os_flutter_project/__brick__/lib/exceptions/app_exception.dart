/// Base class for all all client-side errors that can be generated by the app
sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

// Add app exception here
//
// class CustomException extends AppException {
//   CustomException() : super('custom-exception', 'This is a custom exception');
// }