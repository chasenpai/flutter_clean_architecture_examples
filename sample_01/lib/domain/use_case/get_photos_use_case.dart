import 'dart:math';

import 'package:image_searcher/data/data_source/result.dart';
import 'package:image_searcher/domain/model/photo.dart';
import 'package:image_searcher/domain/repository/photo_api_repository.dart';

//Domain Layer
//Use Case - ViewModel이 순수 View와 관련된 작업만 할 수 있도록 비즈니스 로직을 담당한다
class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<Result<List<Photo>>> call(String query) async { //call은 생략 가능
    final result = await repository.fetch(query);
    return result.when(
      success: (photos) {
        return Result.success(photos.sublist(0, min(10, photos.length)));
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
