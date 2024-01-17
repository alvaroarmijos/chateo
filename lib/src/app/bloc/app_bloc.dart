import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CheckUserLoginUseCase _checkUserLoginUseCase;

  AppBloc(
    this._checkUserLoginUseCase,
  ) : super(const AppState()) {
    on<StartAppEvent>(_onStartAppEvent);
  }

  FutureOr<void> _onStartAppEvent(
    StartAppEvent event,
    Emitter emit,
  ) {
    return emit.onEach(
      _checkUserLoginUseCase(),
      onData: (userExists) => emit(
        state.copyWith(
          userExists: userExists,
        ),
      ),
    );
  }
}
