enum ValidateType {
  email,
  password,
}

extension Validation on String {
  bool isValid(ValidateType type) {
    RegExp regex;
    switch (type) {
      case ValidateType.email:
        regex = RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        );
        break;
      case ValidateType.password:
        regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
        break;
    }
    return regex.hasMatch(this);
  }
}
