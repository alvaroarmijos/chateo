// ignore_for_file: void_checks

part of 'sign_in_bloc.dart';

sealed class SignInState {
  const SignInState();
}

final class InitialState implements SignInState {
  const InitialState();
}

final class LoadingState implements SignInState {
  const LoadingState();
}

final class SuccessState implements SignInState {
  const SuccessState();
}

final class ErrorState implements SignInState {
  const ErrorState();
}
