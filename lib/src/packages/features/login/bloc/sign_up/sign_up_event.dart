part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

final class CreateAccountEvent extends SignUpEvent {
  const CreateAccountEvent();
}

final class ChangeNameEvent extends SignUpEvent {
  const ChangeNameEvent(this.name);

  final String name;

  @override
  List<Object?> get props => [name];
}

final class ChangeEmailEvent extends SignUpEvent {
  const ChangeEmailEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

final class ChangePasswordEvent extends SignUpEvent {
  const ChangePasswordEvent(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

final class ChangeConfirmEvent extends SignUpEvent {
  const ChangeConfirmEvent(this.confirm);

  final String confirm;

  @override
  List<Object?> get props => [confirm];
}
