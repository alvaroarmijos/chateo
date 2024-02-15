part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool userExists;

  const AppState({
    this.userExists = false,
  });

  AppState copyWith({
    final bool? userExists,
  }) {
    return AppState(
      userExists: userExists ?? this.userExists,
    );
  }

  @override
  List<Object?> get props => [userExists];
}
