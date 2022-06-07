// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/screen/home.dart';
import 'package:login_bloc/screen/login.dart';

import '../bloc/route/root_bloc.dart';
import '../bloc/route/root_state.dart';

class ScreenRoute extends StatefulWidget {
  final RouteType type;
  final RouteType? previousType;
  const ScreenRoute({Key? key, required this.type, required this.previousType})
      : super(key: key);

  @override
  State<ScreenRoute> createState() =>
      _ScreenRouteState(type: type, previousType: previousType);
}

class _ScreenRouteState extends State<ScreenRoute> {
  final RouteType type;
  RouteType? previousType;

  _ScreenRouteState({required this.type, required this.previousType});
  @override
  Widget build(BuildContext context) {
    debugPrint('previous state: ' + previousType.toString());
    debugPrint('current state: ' + type.toString());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return RouteBloc(type: type);
        }),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<RouteBloc, RouteState>(
            listener: (context, state) {
              final navigator = Navigator.of(context);
              previousType = type;
              _pushNewRootScreen(state, navigator, context);
            },
          ),
        ],
        child: _Screens(type),
      ),
    );
  }

  Widget _Screens(RouteType routeType) {
    switch (routeType) {
      case RouteType.login:
        return const Login(
          previousType: null,
        );

      case RouteType.home:
        return const MyHomePage(
          title: '',
          previousType: null,
        );

      default:
        return Login(
          previousType: previousType,
        );
    }
  }

  void _pushNewRootScreen(
      RouteState state, NavigatorState navigator, BuildContext context) {
    if (state.type == RouteType.login) {
      navigator.pushReplacementNamed(Login.routeName);
    } else if (state.type == RouteType.login) {
      navigator.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, _, __) => ScreenRoute(
            type: RouteType.login,
            previousType: previousType,
          ),
          transitionDuration: const Duration(seconds: 0),
          settings: RouteSettings(arguments: previousType),
        ),
      );
    } else if (state.type == RouteType.home) {
      navigator.pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, _, __) => ScreenRoute(
            type: RouteType.home,
            previousType: previousType,
          ),
          transitionDuration: const Duration(seconds: 0),
          settings: RouteSettings(arguments: previousType),
        ),
      );
    }
  }
}
