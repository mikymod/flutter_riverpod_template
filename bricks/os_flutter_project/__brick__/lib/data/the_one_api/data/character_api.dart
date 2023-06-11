import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:os_flutter_project/data/the_one_api/data/icharacter_api.dart';

import 'package:os_flutter_project/data/the_one_api/the_one_api.dart';

class CharacterApi extends ICharacterApi {
  @override
  Future<List<Character>> characters() async {
    final response = await http.get(
      Uri.https('the-one-api.dev', '/v2/character'),
      headers: {'Authorization': 'Bearer apwbgwrYkncJz6efu01X'},
    );
    final characterResponse = CharacterResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    return characterResponse.docs;
  }
}
