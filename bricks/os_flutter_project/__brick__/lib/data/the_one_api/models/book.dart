import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class BookResponse with _$BookResponse {
  @JsonSerializable(explicitToJson: true)
  const factory BookResponse({
    required List<Book> docs,
    required int total,
    required int limit,
    required int offset,
    required int page,
    required int pages,
  }) = _BookResponse;

  factory BookResponse.fromJson(Map<String, dynamic> json) => _$BookResponseFromJson(json);
}

@freezed
class Book with _$Book {
  const factory Book({
    @JsonKey(name: '_id') required String id,
    required String name,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

@freezed
class ChapterResponse with _$ChapterResponse {
  @JsonSerializable(explicitToJson: true)
  const factory ChapterResponse({
    required List<Chapter> docs,
    required int total,
    required int limit,
    required int offset,
    required int page,
    required int pages,
  }) = _ChapterResponse;

  factory ChapterResponse.fromJson(Map<String, dynamic> json) => _$ChapterResponseFromJson(json);
}

@freezed
class Chapter with _$Chapter {
  const factory Chapter({
    @JsonKey(name: '_id') required String id,
    required String chapterName,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
