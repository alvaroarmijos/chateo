class UnknownChatException implements Exception {}

class ChatsException implements Exception {
  @override
  String toString() => 'Error while obtaining information';
}
