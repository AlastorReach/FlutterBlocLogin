import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/signup_bloc/signup_bloc.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/signup_bloc/signup_event.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/signup_bloc/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
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
                  BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.error)),
                        );
                      }
                    },
                    child: BlocBuilder<SignUpBloc, SignUpState>(
                      builder: (context, state) {
                        if (state is SignUpLoading) {
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
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<SignUpBloc>().add(
                                        SignUpButtonPressed(
                                          username: _usernameController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                },
                                child: const Text('Register'),
                              ),
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
