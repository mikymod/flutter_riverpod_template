import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class CharacterResponse with _$CharacterResponse {
  @JsonSerializable(explicitToJson: true)
  const factory CharacterResponse({
    required List<Character> docs,
    required int total,
    required int limit,
    required int offset,
    required int page,
    required int pages,
  }) = _CharacterResponse;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => _$CharacterResponseFromJson(json);
}

@freezed
class Character with _$Character {
  const factory Character({
    @JsonKey(name: '_id') required String id,
    required String name,
    String? height,
    String? race,
    String? gender,
    String? birth,
    String? spouse,
    String? death,
    String? realm,
    String? hair,
    String? wikiUrl,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
}
