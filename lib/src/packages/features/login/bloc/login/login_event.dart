part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class LogInWithEmailAndPasswordEvent extends LoginEvent {
  const LogInWithEmailAndPasswordEvent();
}

final class ChangeEmailLoginEvent extends LoginEvent {
  const ChangeEmailLoginEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

final class ChangePasswordLoginEvent extends LoginEvent {
  const ChangePasswordLoginEvent(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}
