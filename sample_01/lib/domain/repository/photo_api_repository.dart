import 'package:image_searcher/domain/model/photo.dart';

//Domain Layer
//- Repository(Interface)
abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}