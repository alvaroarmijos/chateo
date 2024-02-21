import '../domain/chat_user/chat_user_repository.dart';

class UpdateUserStatusUseCase {
  const UpdateUserStatusUseCase(this._chatUserRepository);

  final ChatUserRepository _chatUserRepository;

  Future<void> call(
    String uid,
    String name,
    bool status,
    String? photoUrl,
    String? token,
  ) =>
      _chatUserRepository.updateById(
        uid,
        name,
        status,
        photoUrl,
        token,
      );
}
