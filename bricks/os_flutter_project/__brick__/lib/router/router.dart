import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:{{project_name}}/sample_feature/sample_item_list_view.dart';

part 'router.g.dart';

enum AppRoute { home, sampleFeature, settings }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: '/',
        builder: (context, state) => const SampleItemListView(),
      ),
    ],
  );
}
