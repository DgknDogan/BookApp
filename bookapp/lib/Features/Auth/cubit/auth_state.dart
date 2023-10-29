part of 'auth_cubit.dart';

@immutable
class AuthState {
  final bool isChecked;

  const AuthState({required this.isChecked});

  AuthState copyWith({
    bool? isChecked,
  }) {
    return AuthState(isChecked: isChecked ?? this.isChecked);
  }
}
