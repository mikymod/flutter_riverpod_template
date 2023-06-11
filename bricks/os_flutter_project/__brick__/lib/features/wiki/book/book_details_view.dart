import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{project_name}}/data/the_one_api/the_one_api.dart';
import 'package:{{project_name}}/features/wiki/providers.dart';

class BookDetailsView extends ConsumerWidget {
  const BookDetailsView({
    required this.book,
    super.key,
  });
  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: SafeArea(
        child: ref.watch(bookChaptersProvider(book: book)).when(
              data: (chapters) {
                return ListView.separated(
                  itemCount: chapters.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(chapters[index].chapterName),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                );
              },
              error: (error, stackTrace) => const Center(child: Text('Unable to retrieve data')),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
