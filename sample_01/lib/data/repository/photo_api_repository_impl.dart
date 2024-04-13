import 'package:image_searcher/data/data_source/pixabay_api.dart';
import 'package:image_searcher/domain/repository/photo_api_repository.dart';

import 'package:image_searcher/domain/model/photo.dart';

//Data Layer
//- Repository(Implements)
class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async {
    final hits = await api.fetch(query);
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
