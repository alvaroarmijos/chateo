import 'package:bloc/bloc.dart';
import 'package:chateo/data/account/domain/auth_service.dart';
import 'package:chateo/data/chat/domain/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

class ProfileCubit extends Cubit<void> {
  ProfileCubit() : super(());
  final authService = _getIt<AuthService>();
  final chatService = _getIt<ChatService>();

  Future<void> logOut(User user) async {
    await chatService.updateUserStatus(
      user.uid,
      user.displayName ?? '',
      user.photoURL,
      false,
    );
    return authService.logOut();
  }
}
