import 'package:go_router/go_router.dart';
import 'package:login_app/modules/auth_module/screens/login_screen/index.dart';
import 'package:login_app/modules/auth_module/screens/signup_screen/index.dart';

final authRoutes =
    GoRoute(path: '/auth', builder: (context, state) => LoginScreen(), routes: [
  GoRoute(
    path: 'signup',
    builder: (context, state) => SignUpScreen(),
  )
]);
