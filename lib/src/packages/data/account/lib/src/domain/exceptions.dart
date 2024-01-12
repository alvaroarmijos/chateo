class UnknownLoginException implements Exception {}

class InvalidEmailException implements Exception {
  @override
  String toString() => 'The email is invalid';
}
