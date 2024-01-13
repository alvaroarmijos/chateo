import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/account/account.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final LogInWithGoogleUseCase _logInWithGoogleUseCase;

  SignInBloc(
    this._logInWithGoogleUseCase,
  ) : super(const InitialState()) {
    on<LogInWithGoogleEvent>(_onLogInWithGoogleEvent);
  }

  FutureOr<void> _onLogInWithGoogleEvent(
    LogInWithGoogleEvent event,
    Emitter emit,
  ) async {
    return emit.forEach<void>(
      _logInWithGoogleUseCase().asStream(),
      onData: (value) => const SuccessState(),
      onError: (_, __) => const ErrorState(),
    );
  }
}
