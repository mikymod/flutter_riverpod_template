import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:{{project_name}}/data/the_one_api/data/imovie_api.dart';
import 'package:{{project_name}}/data/the_one_api/the_one_api.dart';

class MovieApi extends IMovieApi {
  @override
  Future<List<Movie>> movies() async {
    final response = await http.get(
      Uri.https('the-one-api.dev', '/v2/movie'),
      headers: {'Authorization': 'Bearer apwbgwrYkncJz6efu01X'},
    );
    final movieResponse = MovieResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    return movieResponse.docs;
  }
}
