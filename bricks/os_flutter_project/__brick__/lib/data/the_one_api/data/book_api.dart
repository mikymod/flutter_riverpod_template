import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:os_flutter_project/data/the_one_api/data/ibook_api.dart';
import 'package:os_flutter_project/data/the_one_api/the_one_api.dart';

///
class BookApi extends IBookApi {
  @override
  Future<List<Book>> books() async {
    final response = await http.get(
      Uri.https('the-one-api.dev', '/v2/book'),
      headers: {'Authorization': 'Bearer apwbgwrYkncJz6efu01X'},
    );
    final bookResponse = BookResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    return bookResponse.docs;
  }

  @override
  Future<List<Chapter>> bookChapters(Book book) async {
    final response = await http.get(
      Uri.https('the-one-api.dev', '/v2/book/${book.id}/chapter'),
      headers: {'Authorization': 'Bearer apwbgwrYkncJz6efu01X'},
    );
    final chapterResponse = ChapterResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    return chapterResponse.docs;
  }
}
