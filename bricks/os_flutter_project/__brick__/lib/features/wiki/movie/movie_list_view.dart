import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/features/wiki/providers.dart';
import 'package:{{project_name}}/router/router.dart';

class MovieListView extends ConsumerWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(moviesProvider).when(
          data: (movies) {
            return ListView.separated(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  title: Text(movie.name),
                  onTap: () {
                    context.goNamed(
                      AppRoute.movieDetails.name,
                      queryParameters: {'movie': jsonEncode(movie.toJson())},
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          },
          error: (error, stackTrace) => const Center(child: Text('Unable to retrieve data')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
