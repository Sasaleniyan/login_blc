import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/bloc/route/root_bloc.dart';
// import 'package:login_bloc/bloc/route/bloc/root_bloc.dart';
import 'package:login_bloc/form/form_props.dart';

import '../bloc/login/login_bloc.dart';
import '../bloc/login/login_event.dart';
import '../bloc/login/login_state.dart';
import '../bloc/route/root_event.dart';
import '../bloc/route/root_state.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';
  final RouteType? previousType;
  const Login({Key? key, this.previousType}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) {
            final bloc = LoginBloc();
            return bloc;
          },
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginAuthorizationSucceeded) {
                context.read<RouteBloc>().add(RouteGoHomeScreen());
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          InputDecoration(errorText: state.email?.errorMessage),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              LoginPropertyChangedEvent(
                                  LoginFormProperty.email, value),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          errorText: state.password?.errorMessage),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                              LoginPropertyChangedEvent(
                                  LoginFormProperty.password, value),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: state.password?.propertyIsValid ?? false
                              ? () async {
                                  context
                                      .read<RouteBloc>()
                                      .add(RouteGoHomeScreen());
                                }
                              : null,
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
