part of 'login_bloc.dart';

final class LoginState {
  const LoginState({
    this.status = Status.error,
    this.email,
    this.password,
    this.error,
  });

  final Status status;
  final String? email;
  final String? password;
  final Object? error;

  bool get showLogInButton =>
      ((email?.isNotEmpty ?? false) && (password?.isNotEmpty ?? false));

  bool get showErrorEmail =>
      error != null ? error is InvalidEmailException : false;

  LoginState copyWith({
    final Status? status,
    final String? email,
    final String? password,
    final Object? error,
  }) =>
      LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        error: error ?? this.error,
      );
}
