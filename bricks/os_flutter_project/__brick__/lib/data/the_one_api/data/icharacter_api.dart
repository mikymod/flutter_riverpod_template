import 'package:{{project_name}}/data/the_one_api/models/character.dart';

///
abstract class ICharacterApi {
  Future<List<Character>> characters();
}
