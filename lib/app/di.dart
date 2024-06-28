import 'package:chateo/data/account/domain/auth_service.dart';
import 'package:chateo/data/account/infraestructure/auth_service_impl.dart';
import 'package:chateo/data/chat/domain/chat_service.dart';
import 'package:chateo/data/chat/infraestructure/chat_service_impl.dart';
import 'package:chateo/data/messages/infraestructure/message_service_impl.dart';
import 'package:get_it/get_it.dart';

import '../data/messages/domain/message_service.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerSingleton<AuthService>(AuthServiceImpl());
  getIt.registerSingleton<ChatService>(ChatServiceImpl());
  getIt.registerSingleton<MessageService>(MessageServiceImpl());
}
