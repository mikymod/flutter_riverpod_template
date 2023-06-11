import 'package:os_flutter_project/data/the_one_api/the_one_api.dart';

class ApiRepository {
  const ApiRepository({
    required this.bookApi,
    required this.movieApi,
    required this.characterApi,
  });

  final IBookApi bookApi;
  final IMovieApi movieApi;
  final ICharacterApi characterApi;

  Future<List<Book>> books() => bookApi.books();
  Future<List<Chapter>> bookChapters(Book book) => bookApi.bookChapters(book);

  Future<List<Movie>> movies() => movieApi.movies();

  Future<List<Character>> characters() => characterApi.characters();
}
