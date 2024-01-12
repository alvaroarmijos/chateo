part of 'sign_up_bloc.dart';

sealed class SignUpEvent {
  const SignUpEvent();
}

final class CreateAccountEvent extends SignUpEvent {
  const CreateAccountEvent();
}
