import 'package:image_searcher/data/data_source/pixabay_api.dart';
import 'package:image_searcher/data/data_source/result.dart';
import 'package:image_searcher/domain/repository/photo_api_repository.dart';

import 'package:image_searcher/domain/model/photo.dart';

//Data Layer
//Repository(Implements) - data source에 접근하고 결과를 모델에 맞게 변환하는 등의 기능을 담당
class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final result = await api.fetch(query);
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
