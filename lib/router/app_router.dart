import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_bloc.dart';
import 'package:login_app/infrastructure/blocs/session_bloc/session_state.dart';
import 'package:login_app/modules/auth_module/router/auth_router.dart';
import 'package:login_app/modules/session_module/router/session_routes.dart';
import 'package:login_app/theme/themes.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        final initialRoute = GoRoute(
            path: '/',
            redirect: (_, __) =>
                state == SessionLoggedIn() ? '/session' : '/auth');

        final router = GoRouter(
          initialLocation: '/',
          debugLogDiagnostics: true,
          routes: [initialRoute, authRoutes, sessionRoutes],
        );

        return MaterialApp.router(
          routerConfig: router,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}
