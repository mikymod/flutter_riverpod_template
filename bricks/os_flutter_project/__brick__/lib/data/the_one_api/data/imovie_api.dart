import 'package:{{project_name}}/data/the_one_api/models/movie.dart';

///
abstract class IMovieApi {
  Future<List<Movie>> movies();
}
