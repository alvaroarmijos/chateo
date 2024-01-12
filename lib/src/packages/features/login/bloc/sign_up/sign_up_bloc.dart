import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class LoginBloc extends Bloc<SignUpEvent, SignUpState> {
  LoginBloc(
    this._signUpUseCase,
  ) : super(const InitialState()) {
    on<CreateAccountEvent>(_onCreateAccountEvent);
  }

  final SignUpUseCase _signUpUseCase;

  FutureOr<void> _onCreateAccountEvent(
    CreateAccountEvent event,
    Emitter emit,
  ) async {
    return emit.forEach<void>(
      _signUpUseCase().asStream(),
      onData: (value) => const SuccessState(),
      onError: (_, __) => const ErrorState(),
    );
  }
}
