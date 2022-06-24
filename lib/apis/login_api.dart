import 'package:flutter/foundation.dart' show immutable;
import 'package:login_bloc/models/models.dart';

@immutable
abstract class LoginApiProtocol {
  const LoginApiProtocol();

  Future<LoginHandle?> login({
    required String email,
    required String password,
  });
}

@immutable
class LoginApi implements LoginApiProtocol {
  const LoginApi._shareInstance();
  static const LoginApi _shared = LoginApi._shareInstance();
  factory LoginApi.instance() => _shared;

  @override
  Future<LoginHandle?> login(
      {required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
