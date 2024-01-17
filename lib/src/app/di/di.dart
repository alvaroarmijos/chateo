import 'package:chateo/src/app/bloc/app_bloc.dart';
import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/application/send_message_use_case.dart';
import 'package:chateo/src/packages/data/chat/lib/src/application/update_user_status_use_case.dart';
import 'package:chateo/src/packages/data/device/device.dart';
import 'package:chateo/src/packages/features/chat_detail/chat_detail.dart';
import 'package:chateo/src/packages/features/home/src/bloc/home_bloc.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:chateo/src/packages/features/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../notification/notification_setup.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// App
  ///
  /// Bloc
  sl.registerFactory(() => AppBloc(sl()));

  /// Account
  ///
  /// UseCases
  sl.registerLazySingleton(() => CheckUserLoginUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  sl.registerLazySingleton(() => LogInWithGoogleUseCase(sl()));
  sl.registerLazySingleton(() => LogInWithEmailAndPasswordUseCase(sl(), sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl(), sl(), sl()));

  /// Domain
  sl.registerLazySingleton(() => const EmailValidator());
  sl.registerLazySingleton(() => const PasswordValidator());

  /// Infrastructure
  sl.registerLazySingleton(() => const UserMapper());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl(), sl()));
  sl.registerLazySingleton(() => AccountApiClient(sl(), sl()));

  /// Chat
  ///
  /// UseCases
  sl.registerLazySingleton(() => GetChatUsersUseCase(sl()));
  sl.registerLazySingleton(() => UpdateUserStatusUseCase(sl()));
  sl.registerLazySingleton(() => GetChatUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));

  /// Infrastructure
  sl.registerLazySingleton(() => const ChatUserMapper());
  sl.registerLazySingleton<ChatUserRepository>(() => ChatUserRepositoryImpl(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton(() => const MessageMapper());
  sl.registerLazySingleton<MessageRepository>(() => MessageRepositoryImpl(
        sl(),
        sl(),
      ));

  sl.registerLazySingleton(() => ChatApiClient(sl()));

  /// Device
  ///
  /// UseCases
  sl.registerLazySingleton(() => GetFcmTokenUseCase(sl()));

  /// Features

  /// Login
  /// //Bloc
  sl.registerFactory(() => LoginBloc(sl()));

  /// SignIn
  /// //Bloc
  sl.registerFactory(() => SignInBloc(sl()));

  /// SignUp
  /// //Bloc
  sl.registerFactory(() => SignUpBloc(sl()));

  /// Home
  /// //Bloc
  sl.registerFactory(() => HomeBloc(sl(), sl(), sl(), sl()));

  /// Chat
  /// //Bloc
  sl.registerFactory(() => ChatBloc(sl(), sl()));

  /// Profile
  /// //Bloc
  sl.registerFactory(() => ProfileBloc(sl(), sl(), sl()));

  ///Notifications
  sl.registerLazySingleton(() => NotificationSetup(sl()));

  //External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseMessaging.instance);
}
