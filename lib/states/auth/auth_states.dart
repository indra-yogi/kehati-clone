import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart'

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {

}

class Unauthenticated extends AuthState {

}

class Authenticated extends AuthState {
  final User user;

  Authenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthFail extends AuthState {
  final String msg;

  AuthFail({@required this.msg});

  @override
  List<Object> get props => [msg];
}