import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/route/root_bloc.dart';

import '../bloc/route/root_event.dart';
import '../bloc/route/root_state.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  final RouteType? previousType;
  const MyHomePage({Key? key, required this.title, this.previousType})
      : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Home',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<RouteBloc>().add(RouteGoLoginScreen());
                },
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
