import 'package:go_router/go_router.dart';
import 'package:login_app/modules/session_module/screens/details_screen/index.dart';
import 'package:login_app/modules/session_module/screens/home_screen/index.dart';

final sessionRoutes = GoRoute(
    path: '/session',
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'signup',
        builder: (context, state) => const DetailsScreen(),
      )
    ]);
