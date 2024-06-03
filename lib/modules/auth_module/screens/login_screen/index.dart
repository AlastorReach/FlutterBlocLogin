import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_bloc.dart';
import 'package:login_app/modules/auth_module/screens/login_screen/login_bloc/login_bloc.dart';
import 'package:login_app/modules/auth_module/screens/login_screen/login_bloc/login_event.dart';
import 'package:login_app/modules/auth_module/screens/login_screen/login_bloc/login_state.dart';
import 'package:login_app/presentation/widgets/login_with_facebook_button/index.dart';
import 'package:login_app/presentation/widgets/login_with_google_button/index.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<SessionBloc>()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                      width: double.infinity, child: LoginWithGoogleButton()),
                  const SizedBox(
                      width: double.infinity, child: LoginWithFacebookButton()),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Or'),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return Column(
                          children: [
                            TextField(
                              controller: _usernameController,
                              decoration:
                                  const InputDecoration(labelText: 'Username'),
                            ),
                            TextField(
                              controller: _passwordController,
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<LoginBloc>().add(
                                        LoginButtonPressed(
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                },
                                child: const Text('Login'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      context.push('/auth/signup');
                                    },
                                    child: const Text(
                                      "Don't have an account? Signup",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline),
                                    ))
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
