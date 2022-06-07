import 'package:equatable/equatable.dart';
import 'package:login_bloc/extension/string_validation.dart';
import 'package:login_bloc/form/form_item.dart';
import 'package:login_bloc/form/form_props.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email,
    this.password,
    this.inProgress = false,
    this.errorMessage,
  });
  final FormPropsItems? email;
  final FormPropsItems? password;
  final bool? inProgress;
  final FormPropsItems? errorMessage;

  LoginState copyWithPropertyType(
      LoginFormProperty type, ValidateType? validator,
      {String? value, bool? valueIsDirty, String? erroMessage}) {
    final isValid = validator != null
        ? value?.isValid(validator) == true
        : (value?.length ?? 0) > 8;

    return copyWithProperty(
      email: type == LoginFormProperty.email
          ? email?.copyWith(value, valueIsDirty, isValid ? null : erroMessage)
          : null,
      password: type == LoginFormProperty.password
          ? password?.copyWith(
              value, valueIsDirty, isValid ? null : erroMessage)
          : null,
    );
  }

  LoginState copyWithProperty({
    FormPropsItems? email,
    FormPropsItems? password,
  }) {
    return LoginState(
        email: email ?? this.email, password: password ?? this.password);
  }

  LoginState copyWith({
    bool inProgress = false,
    String? errorMessage,
    bool? isPasswordVisible = false,
    String? code,
  }) {
    return LoginState(
      email: email,
      password: password,
      inProgress: inProgress,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        inProgress,
        errorMessage,
      ];
}

class LoginAuthorizationSucceeded extends LoginState {}
