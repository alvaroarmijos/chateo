import 'package:firebase_messaging/firebase_messaging.dart';

class GetFcmTokenUseCase {
  final FirebaseMessaging _messaging;

  const GetFcmTokenUseCase(this._messaging);

  Future<String?> call() => _messaging.getToken();
}
