import 'package:flutter/material.dart';
import 'package:login_bloc/screen/home.dart';
import 'package:login_bloc/screen/login.dart';

import '../bloc/route/root_state.dart';
import 'route.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const ScreenRoute(
            type: RouteType.login,
            previousType: null,
          );
        } else if (snapshot.hasData) {
          return const ScreenRoute(
            type: RouteType.login,
            previousType: null,
          );
        } else {
          return const ScreenRoute(
            type: RouteType.login,
            previousType: null,
          );
        }
      }),
      routes: {
        Login.routeName: (context) =>
            const ScreenRoute(type: RouteType.login, previousType: null),
        MyHomePage.routeName: (context) => const ScreenRoute(
            type: RouteType.home, previousType: RouteType.login),
      },
    );
  }
}
