part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final String username;

  LoginLoaded(
    this.username,
  );
}

class LoginError extends LoginState {}
