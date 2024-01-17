import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/chat/lib/src/application/update_user_status_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getUserUseCase,
    this._logOutUseCase,
    this._updateUserStatusUseCase,
  ) : super(const ProfileLoading()) {
    on<GetUserEvent>(_onGetUserEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }

  final GetUserUseCase _getUserUseCase;
  final LogOutUseCase _logOutUseCase;
  final UpdateUserStatusUseCase _updateUserStatusUseCase;

  FutureOr<void> _onGetUserEvent(
    GetUserEvent event,
    Emitter<ProfileState> emit,
  ) {
    return emit.forEach(
      _getUserUseCase(),
      onData: (user) =>
          user != null ? ProfileSuccess(user) : const ProfileError(),
      onError: (_, __) => const ProfileError(),
    );
  }

  FutureOr<void> _onLogOutEvent(
    LogOutEvent event,
    Emitter<ProfileState> emit,
  ) {
    return emit.onEach(
      _updateUserStatusUseCase(
        event.user.uid,
        event.user.name ?? '',
        event.user.photoUrl,
        false,
        null,
      )
          .then(
            (_) => _logOutUseCase(),
          )
          .asStream(),
      onData: (data) {},
    );
  }
}
