import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_event.dart';
import 'package:login_app/router/app_router.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SessionBloc()..add(CheckSession()),
      ),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppRouter();
  }
}