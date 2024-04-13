import 'package:image_searcher/data/data_source/result.dart';
import 'package:image_searcher/domain/model/photo.dart';

//Domain Layer
//Repository(Interface)
abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}