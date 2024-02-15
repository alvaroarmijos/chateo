import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;

  SignInBloc(
    this._signInWithGoogleUseCase,
  ) : super(const InitialState()) {
    on<LogInWithGoogleEvent>(_onLogInWithGoogleEvent);
  }

  FutureOr<void> _onLogInWithGoogleEvent(
    LogInWithGoogleEvent event,
    Emitter emit,
  ) async {
    return emit.forEach(
      _signInWithGoogleUseCase().asStream(),
      onData: (value) => const SuccessState(),
      onError: (_, __) => const ErrorState(),
    );
  }
}
