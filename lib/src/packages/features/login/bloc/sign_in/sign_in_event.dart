part of 'sign_in_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();
}

final class LogInWithGoogleEvent extends SignInEvent {
  const LogInWithGoogleEvent();
}
