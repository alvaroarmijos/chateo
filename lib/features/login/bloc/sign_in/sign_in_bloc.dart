import 'dart:async';

import 'package:chateo/data/account/domain/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

final _getIt = GetIt.instance;

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogleEvent);
  }

  final authService = _getIt<AuthService>();

  FutureOr<void> _onSignInWithGoogleEvent(
    SignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    await authService.loginWithGoogle();
  }
}
