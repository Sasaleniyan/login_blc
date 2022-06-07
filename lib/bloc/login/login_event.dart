import 'package:equatable/equatable.dart';
import 'package:login_bloc/form/form_props.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPropertyChangedEvent extends LoginEvent {
  final LoginFormProperty type;
  final String value;

  const LoginPropertyChangedEvent(this.type, this.value);

  @override
  List<Object> get props => [type, value];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final LoginEmailChanged email;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChange extends LoginEvent {
  const LoginPasswordChange(this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginSubmittedEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

// class LogoutRequest extends LoginEvent {
//    LoginSubmitted() {
//    // TODO: implement LoginSubmitted
//    throw UnimplementedError();
//  }
// }
