import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:login_bloc/bloc/route/root_event.dart';
import 'package:login_bloc/bloc/route/root_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc({required RouteType type}) : super(RouteState(type: type)) {
    on<RouteGoLoginScreen>(
      (event, emit) => emit(state.copyWith(type: RouteType.login)),
    );
    on<RouteGoHomeScreen>(
      (event, emit) => emit(state.copyWith(type: RouteType.home)),
    );
  }

  @override
  void onChange(Change<RouteState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
