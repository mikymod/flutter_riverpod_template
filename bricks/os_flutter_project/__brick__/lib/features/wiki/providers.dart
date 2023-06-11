import 'package:{{project_name}}/data/the_one_api/the_one_api.dart';
import 'package:{{project_name}}/features/wiki/api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

///
@Riverpod(keepAlive: true)
ApiRepository apiRepository(ApiRepositoryRef ref) => ApiRepository(
      bookApi: BookApi(),
      movieApi: MovieApi(),
      characterApi: CharacterApi(),
    );

///
@riverpod
Future<List<Book>> books(BooksRef ref) async => ref.watch(apiRepositoryProvider).books();

///
@riverpod
Future<List<Movie>> movies(MoviesRef ref) async => ref.watch(apiRepositoryProvider).movies();

///
@riverpod
Future<List<Character>> characters(CharactersRef ref) async => ref.watch(apiRepositoryProvider).characters();

///
@riverpod
Future<List<Chapter>> bookChapters(BookChaptersRef ref, {required Book book}) async {
  return ref.watch(apiRepositoryProvider).bookChapters(book);
}
