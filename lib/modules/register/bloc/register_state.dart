part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final String username;

  RegisterLoaded(
    this.username,
  );
}

class RegisterError extends RegisterState {}
