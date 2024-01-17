import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/user/user.dart' as domain;

class UserMapper {
  const UserMapper();

  domain.User fromApiDto(User dto) {
    final uid = dto.uid;
    final name = dto.displayName;
    final email = dto.email;
    final photoURL = dto.photoURL;
    final phoneNumber = dto.phoneNumber;

    return domain.User(
      uid: uid,
      name: name,
      email: email,
      photoUrl: photoURL,
      phoneNumber: phoneNumber,
    );
  }
}
