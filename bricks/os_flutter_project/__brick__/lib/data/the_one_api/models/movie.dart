import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  @JsonSerializable(explicitToJson: true)
  const factory MovieResponse({
    required List<Movie> docs,
    required int total,
    required int limit,
    required int offset,
    required int page,
    required int pages,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    @JsonKey(name: '_id') required String id,
    required String name,
    @Default(0) int runtimeInMinutes,
    @Default(0) double budgetInMillions,
    @Default(0) double boxOfficeRevenueInMillions,
    @Default(0) int academyAwardNominations,
    @Default(0) int academyAwardWins,
    @Default(0) double rottenTomatoesScore,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
