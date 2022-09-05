import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {}

class InitializeAuth extends AuthState {
  @override
  List<Object?> get props => [];
}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);

  @override
  List<Object?> get props => [];
}
