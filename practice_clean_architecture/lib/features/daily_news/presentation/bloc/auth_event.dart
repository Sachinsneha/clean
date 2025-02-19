part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

final class AuthSingUp extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const AuthSingUp(
      {required this.name, required this.email, required this.password});
}
