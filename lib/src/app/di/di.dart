import 'package:chateo/src/app/bloc/app_bloc.dart';
import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/features/home/src/bloc/home_bloc.dart';
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

  /// Infrastructure
  sl.registerLazySingleton(() => const ChatUserMapper());
  sl.registerLazySingleton<ChatUserRepository>(
      () => ChatUserRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton(() => ChatApiClient(sl()));

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
  sl.registerFactory(() => HomeBloc(sl()));

  //External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
}
