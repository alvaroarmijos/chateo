import 'dart:async';

import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/account/account.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
    this._logInWithEmailAndPasswordUseCase,
  ) : super(const LoginState()) {
    on<LogInWithEmailAndPasswordEvent>(_onLogInWithEmailAndPasswordEvent);
    on<ChangeEmailLoginEvent>(_onChangeEmailLoginEvent);
    on<ChangePasswordLoginEvent>(_onChangePasswordLoginEvent);
  }

  final LogInWithEmailAndPasswordUseCase _logInWithEmailAndPasswordUseCase;

  FutureOr<void> _onLogInWithEmailAndPasswordEvent(
    LogInWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(status: Status.loading, error: Object()));
    return emit.forEach<void>(
      _logInWithEmailAndPasswordUseCase(
        state.email!.trim(),
        state.password!.trim(),
      ).asStream(),
      onData: (value) => state.copyWith(status: Status.success),
      onError: (error, __) =>
          state.copyWith(status: Status.error, error: error),
    );
  }

  FutureOr<void> _onChangeEmailLoginEvent(
    ChangeEmailLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(email: event.email, error: Object()));
  }

  FutureOr<void> _onChangePasswordLoginEvent(
    ChangePasswordLoginEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(password: event.password, error: Object()));
  }
}
