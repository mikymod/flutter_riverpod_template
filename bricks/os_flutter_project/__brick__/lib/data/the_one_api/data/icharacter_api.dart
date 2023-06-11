import 'package:os_flutter_project/data/the_one_api/models/character.dart';

///
abstract class ICharacterApi {
  Future<List<Character>> characters();
}
