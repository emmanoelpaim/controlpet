part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class Register extends RegisterEvent {
  final String userName;
  final String password;

  Register(this.userName, this.password);
}
