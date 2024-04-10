import 'package:image_searcher/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}