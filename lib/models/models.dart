import 'package:flutter/foundation.dart';

@immutable
class LoginHandle {
  final token;
  const LoginHandle({
    required this.token,
  });
  const LoginHandle.fooBar() : token = 'foobar';

  @override
  bool operator ==(covariant LoginHandle other) => token == other.token;

  @override
  int get hashCode => token.hashCode;

  @override
  String toString() => 'Login ( token = $token)';
}

enum LoginErrors { invalidHandle }

@immutable
class Note {
  final String title;
  const Note({required this.title});

  @override
  String toString() => 'Note (title = $title)';
}

final mockNote = Iterable.generate(
  3,
  (i) => Note(title: 'Note ${i + 1}'),
);
