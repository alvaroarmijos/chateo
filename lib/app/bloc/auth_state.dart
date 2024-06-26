part of 'auth_bloc.dart';

final class AuthState {
  AuthState({this.user});

  final User? user;

  bool get existUser => user != null;
}
