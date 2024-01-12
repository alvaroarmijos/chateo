part of 'sign_up_bloc.dart';

sealed class SignUpState {
  const SignUpState();
}

final class InitialState implements SignUpState {
  const InitialState();
}

final class LoadingState implements SignUpState {
  const LoadingState();
}

final class SuccessState implements SignUpState {
  const SuccessState();
}

final class ErrorState implements SignUpState {
  const ErrorState();
}
