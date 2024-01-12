// ignore_for_file: void_checks

part of 'login_bloc.dart';

sealed class LoginState {
  const LoginState();
}

final class InitialState implements LoginState {
  const InitialState();
}

final class LoadingState implements LoginState {
  const LoadingState();
}

final class SuccessState implements LoginState {
  const SuccessState();
}

final class ErrorState implements LoginState {
  const ErrorState();
}
