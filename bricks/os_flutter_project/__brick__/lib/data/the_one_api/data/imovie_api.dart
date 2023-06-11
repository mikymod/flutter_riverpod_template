import 'package:os_flutter_project/data/the_one_api/models/movie.dart';

///
abstract class IMovieApi {
  Future<List<Movie>> movies();
}
