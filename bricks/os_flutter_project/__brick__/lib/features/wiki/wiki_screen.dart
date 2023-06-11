import 'package:flutter/material.dart';
import 'package:os_flutter_project/features/wiki/book/book_list_view.dart';
import 'package:os_flutter_project/features/wiki/character/character_list_view.dart';
import 'package:os_flutter_project/features/wiki/movie/movie_list_view.dart';

enum PageTabs { books, movies, characters }

class WikiScreen extends StatelessWidget {
  const WikiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: PageTabs.values.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.book),
                child: Text(PageTabs.books.name),
              ),
              Tab(
                icon: const Icon(Icons.movie),
                child: Text(PageTabs.movies.name),
              ),
              Tab(
                icon: const Icon(Icons.people),
                child: Text(PageTabs.characters.name),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BooksListView(),
            MovieListView(),
            CharacterListView(),
          ],
        ),
      ),
    );
  }
}
