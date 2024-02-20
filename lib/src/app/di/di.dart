import 'package:chateo/src/app/bloc/app_bloc.dart';
import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/account/lib/src/infrastructure/user/user_mapper.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/chat_user/chat_user_repository.dart';
import 'package:chateo/src/packages/data/chat/lib/src/domain/message/message_repository.dart';
import 'package:chateo/src/packages/data/chat/lib/src/infrastructure/message/message_repository_impl.dart';
import 'package:chateo/src/packages/features/chat_detail/src/bloc/chat_bloc.dart';
import 'package:chateo/src/packages/features/home/home.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// App
  ///
  /// Bloc
  sl.registerFactory(() => AppBloc(sl()));

  /// Account
  ///
  /// UseCases
  sl.registerFactory(() => SignInWithGoogleUseCase(sl()));
  sl.registerFactory(() => SignUpUseCase(sl(), sl(), sl()));
  sl.registerFactory(() => LogInUseCase(sl(), sl()));
  sl.registerFactory(() => GetUserUseCase(sl()));
  sl.registerFactory(() => LogOutUseCase(sl()));
  sl.registerFactory(() => CheckUserLoginUseCase(sl()));

  /// Domain
  sl.registerLazySingleton(() => const EmailValidator());
  sl.registerLazySingleton(() => const PasswordValidator());

  /// Infrastructure
  // sl.registerLazySingleton(() => const UserMapper());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl(), sl()));
  sl.registerLazySingleton(() => AccountApiClient(sl(), sl()));
  sl.registerLazySingleton(() => const UserMapper());

  /// Chat
  ///
  /// UseCases
  sl.registerLazySingleton(() => GetChatUserUseCase(sl()));
  // sl.registerLazySingleton(() => UpdateUserStatusUseCase(sl()));
  sl.registerLazySingleton(() => GetChatUseCase(sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(sl()));

  /// Infrastructure
  sl.registerLazySingleton(() => const ChatUserMapper());
  sl.registerLazySingleton<ChatUserRepository>(() => ChatUserRepositoryImpl(
        sl(),
        sl(),
      ));
  sl.registerLazySingleton(() => const MessageMapper());
  sl.registerLazySingleton<MessageRepository>(
      () => MessageRepositoryImpl(sl(), sl()));

  sl.registerLazySingleton(() => ChatApiClient(sl()));

  /// Device
  ///
  /// UseCases
  // sl.registerLazySingleton(() => GetFcmTokenUseCase(sl()));

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
  sl.registerFactory(() => HomeBloc(sl(), sl()));

  /// Chat
  /// //Bloc
  sl.registerFactory(() => ChatBloc(sl(), sl()));

  /// Profile
  /// //Bloc
  // sl.registerFactory(() => ProfileBloc(sl(), sl(), sl()));

  ///Notifications
  // sl.registerLazySingleton(() => NotificationSetup(sl()));

  //External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
  // sl.registerLazySingleton(() => FirebaseMessaging.instance);
}
