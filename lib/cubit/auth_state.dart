part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

//Ketika loading
class AuthLoad extends AuthState {}

//Ketika sukses
class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String err;
  AuthFailed(this.err);

  @override
  List<Object> get props => [err];
}
