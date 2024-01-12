import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/features/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Account
  ///
  /// UseCases
  sl.registerLazySingleton(() => CheckUserLoginUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  sl.registerLazySingleton(() => LogInUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));

  /// Infrastructure
  sl.registerLazySingleton(() => const UserMapper());
  sl.registerLazySingleton<AuthService>(() => AuthServiceImpl(sl(), sl()));
  sl.registerLazySingleton(() => AccountApiClient(sl(), sl()));

  /// Features

  /// Login
  /// //Bloc
  sl.registerFactory(() => LoginBloc(sl()));

  //External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
}
