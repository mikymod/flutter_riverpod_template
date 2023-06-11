import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/features/wiki/providers.dart';
import 'package:{{project_name}}/router/router.dart';

class CharacterListView extends ConsumerWidget {
  const CharacterListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(charactersProvider).when(
          data: (characters) {
            return ListView.separated(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return ListTile(
                  title: Text(character.name),
                  onTap: () {
                    context.goNamed(
                      AppRoute.characterDetails.name,
                      queryParameters: {'character': jsonEncode(character.toJson())},
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
