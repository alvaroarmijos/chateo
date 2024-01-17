import 'dart:async';

import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/data/chat/lib/src/application/update_user_status_use_case.dart';
import 'package:chateo/src/packages/data/device/device.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getChatUsersUseCase,
    this._getUserUseCase,
    this._updateUserStatusUseCase,
    this._getFcmTokenUseCase,
  ) : super(const HomeLoading()) {
    on<GetChatUsersEvent>(_onGetChatUsersEvent);
    on<UpdateUserStatusEvent>(_onUpdateUserStatusEvent);
  }

  final GetChatUsersUseCase _getChatUsersUseCase;
  final GetUserUseCase _getUserUseCase;
  final UpdateUserStatusUseCase _updateUserStatusUseCase;
  final GetFcmTokenUseCase _getFcmTokenUseCase;

  FutureOr<void> _onGetChatUsersEvent(
    GetChatUsersEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.forEach(
      Rx.combineLatest2(
        _getUserUseCase(),
        _getChatUsersUseCase(),
        (user, chats) => (user, chats),
      ),
      onData: (data) {
        final user = data.$1;
        data.$2.removeWhere(
          (element) => element.uid == user?.uid,
        );
        return HomeSucces(data.$2, user);
      },
      onError: (error, stackTrace) => const HomeError(),
    );
  }

  FutureOr<void> _onUpdateUserStatusEvent(
    UpdateUserStatusEvent event,
    Emitter<HomeState> emit,
  ) {
    return emit.onEach(
      Rx.combineLatest2(_getUserUseCase(), _getFcmTokenUseCase().asStream(),
          (user, token) => (user, token)).switchMap(
        (data) => data.$1 != null
            ? _updateUserStatusUseCase(
                data.$1!.uid,
                data.$1!.name ?? '',
                data.$1!.photoUrl,
                event.status,
                data.$2,
              ).asStream()
            : const Stream.empty(),
      ),
      onData: (_) {},
    );
  }
}
