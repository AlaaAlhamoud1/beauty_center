part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LogInEvent extends AuthEvent {
  final String phoneNumber;
  final String password;
  LogInEvent({required this.phoneNumber, required this.password});
}
