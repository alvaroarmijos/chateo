import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
    this._signUpUseCase,
  ) : super(const SignUpState()) {
    on<CreateAccountEvent>(_onCreateAccountEvent);
    on<ChangeNameEvent>(_onChangeNameEvent);
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<ChangeConfirmEvent>(_onChangeConfirmEvent);
  }

  final SignUpUseCase _signUpUseCase;

  FutureOr<void> _onCreateAccountEvent(
    CreateAccountEvent event,
    Emitter emit,
  ) async {
    return emit.forEach<void>(
      _signUpUseCase(
        state.email,
        state.password,
        state.confirm,
        state.name,
      ).asStream(),
      onData: (value) => state.copyWith(status: Status.success),
      onError: (error, __) => state.copyWith(
        status: Status.error,
        error: error,
      ),
    );
  }

  FutureOr<void> _onChangeNameEvent(
    ChangeNameEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(name: event.name, error: Object()));
  }

  FutureOr<void> _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(email: event.email, error: Object()));
  }

  FutureOr<void> _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(password: event.password, error: Object()));
  }

  FutureOr<void> _onChangeConfirmEvent(
    ChangeConfirmEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(confirm: event.confirm, error: Object()));
  }
}
