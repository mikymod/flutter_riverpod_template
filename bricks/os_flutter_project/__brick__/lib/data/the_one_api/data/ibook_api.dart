import 'package:os_flutter_project/data/the_one_api/models/book.dart';

///
abstract class IBookApi {
  Future<List<Book>> books();
  Future<List<Chapter>> bookChapters(Book book);
}
