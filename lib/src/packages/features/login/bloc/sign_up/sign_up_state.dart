part of 'sign_up_bloc.dart';

final class SignUpState {
  const SignUpState({
    this.status = Status.initial,
    this.name,
    this.email,
    this.password,
    this.confirm,
    this.error,
  });

  final Status status;
  final String? name;
  final String? email;
  final String? password;
  final String? confirm;
  final Object? error;

  bool get showCreateAccountButton => ((name?.isNotEmpty ?? false) &&
      (email?.isNotEmpty ?? false) &&
      (password?.isNotEmpty ?? false) &&
      (confirm?.isNotEmpty ?? false));

  bool get showErrorEmail =>
      error != null ? error is InvalidEmailException : false;

  bool get showErrorConfirm =>
      error != null ? error is InvalidPasswordConfirmationException : false;

  SignUpState copyWith({
    final Status? status,
    final String? name,
    final String? email,
    final String? password,
    final String? confirm,
    final Object? error,
  }) =>
      SignUpState(
        status: status ?? this.status,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        confirm: confirm ?? this.confirm,
        error: error ?? this.error,
      );
}
