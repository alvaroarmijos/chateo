part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

final class LogInWithGoogleEvent extends LoginEvent {
  const LogInWithGoogleEvent();
}
