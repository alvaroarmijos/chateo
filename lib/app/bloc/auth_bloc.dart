import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/data/account/domain/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final _getIt = GetIt.instance;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<GetUser>(_onGetUser);
  }

  final authService = _getIt<AuthService>();

  FutureOr<void> _onGetUser(
    GetUser event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      authService.currentUser,
      onData: (user) {
        return AuthState(user: user);
      },
    );
  }
}
