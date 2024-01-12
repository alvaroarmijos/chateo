import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/account/account.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LogInUseCase _login;

  LoginBloc(
    this._login,
  ) : super(const InitialState()) {
    on<LogInWithGoogleEvent>(_onLogInWithGoogleEvent);
  }

  FutureOr<void> _onLogInWithGoogleEvent(
    LogInWithGoogleEvent event,
    Emitter emit,
  ) async {
    return emit.forEach<void>(
      _login().asStream(),
      onData: (value) => const SuccessState(),
      onError: (_, __) => const ErrorState(),
    );
  }
}
