import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/features/wiki/providers.dart';
import 'package:{{project_name}}/router/router.dart';

class BooksListView extends ConsumerWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(booksProvider).when(
          data: (books) {
            return ListView.separated(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return ListTile(
                  title: Text(book.name),
                  onTap: () {
                    context.goNamed(
                      AppRoute.bookDetails.name,
                      queryParameters: book.toJson(),
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
