import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/features/home_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum AppRoute { home }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [],
      ),
    ],
  );
}
