import 'package:firebase_messaging/firebase_messaging.dart';

class GetFcmTokenUseCase {
  const GetFcmTokenUseCase(
    this._messaging,
  );

  final FirebaseMessaging _messaging;

  Future<String?> call() => _messaging.getToken();
}
