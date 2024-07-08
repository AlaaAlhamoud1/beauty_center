part of 'auth_bloc.dart';

@immutable
class AuthState {
  final UserModel? user;
  final String? success;

  final String? message;
  final bool? isLoading;

  const AuthState({
    this.user,
    this.success,
    this.message,
    this.isLoading,
  });

  factory AuthState.initial() => const AuthState();

  AuthState copyWith(
      {UserModel? user, String? message, String? success, bool? isLoading}) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        success: success ?? success,
        message: message ?? this.message,
        user: user ?? user);
  }
}
