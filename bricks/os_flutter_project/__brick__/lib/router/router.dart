import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/data/the_one_api/the_one_api.dart';
import 'package:{{project_name}}/features/wiki/book/book_details_view.dart';
import 'package:{{project_name}}/features/wiki/character/character_details_view.dart';
import 'package:{{project_name}}/features/wiki/movie/movie_details_view.dart';
import 'package:{{project_name}}/features/wiki/wiki_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

enum AppRoute { home, bookDetails, movieDetails, characterDetails }

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: AppRoute.home.name,
        path: '/',
        builder: (context, state) => const WikiScreen(),
        routes: [
          GoRoute(
            name: AppRoute.bookDetails.name,
            path: AppRoute.bookDetails.name,
            builder: (context, state) {
              final json = state.queryParameters;
              final book = Book.fromJson(json);
              return BookDetailsView(book: book);
            },
          ),
          GoRoute(
            name: AppRoute.movieDetails.name,
            path: AppRoute.movieDetails.name,
            builder: (context, state) {
              final json = jsonDecode(state.queryParameters['movie']!) as Map<String, dynamic>;
              final movie = Movie.fromJson(json);
              return MovieDetailsView(movie: movie);
            },
          ),
          GoRoute(
            name: AppRoute.characterDetails.name,
            path: AppRoute.characterDetails.name,
            builder: (context, state) {
              final json = jsonDecode(state.queryParameters['character']!) as Map<String, dynamic>;
              final character = Character.fromJson(json);
              return CharacterDetailsView(character: character);
            },
          ),
        ],
      ),
    ],
  );
}
