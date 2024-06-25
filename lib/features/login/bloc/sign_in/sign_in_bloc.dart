import 'dart:async';

import 'package:chateo/data/account/infraestructure/auth_service_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogleEvent);
  }
  final authService = AuthServiceImpl();

  FutureOr<void> _onSignInWithGoogleEvent(
    SignInWithGoogleEvent event,
    Emitter<SignInState> emit,
  ) async {
    await authService.loginWithGoogle();
  }
}
