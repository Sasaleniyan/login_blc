import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/login/login_state.dart';
import 'package:login_bloc/extension/string_validation.dart';
import 'package:login_bloc/form/form_item.dart';
import 'package:login_bloc/form/form_props.dart';

import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(
            email: FormPropsItems(), password: FormPropsItems())) {
    on<LoginPropertyChangedEvent>((event, emit) => emit(_handleEvent(event)));
    on<LoginSubmittedEvent>(_onLoginEvent, transformer: sequential());
  }

  LoginState _handleEvent(LoginPropertyChangedEvent event) {
    switch (event.type) {
      case LoginFormProperty.email:
        return state.copyWithPropertyType(event.type, ValidateType.email,
            value: event.value,
            valueIsDirty: true,
            erroMessage: 'Must be a valid format');
      case LoginFormProperty.password:
        return state.copyWithPropertyType(event.type, null,
            value: event.value,
            valueIsDirty: true,
            erroMessage: "Please provide a valid password");
    }
  }

  Future<void> _onLoginEvent(
      LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(inProgress: true));
    try {
      final password = state.password!.value;
      final email = state.email!.value;
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
