import 'dart:async';

import 'package:image_searcher/data/photo_api_repository.dart';
import 'package:image_searcher/model/photo.dart';

/*
 MVVM - ViewModel
 View에서 사용자의 입력을 ViewModel로 전달하고
 ViewModel에서 Model로 데이터 요청 및 처리
 View는 Provider나 Stream 등을 통한 상태관리를 통해 View를
 ViewModel은 View에 의존하지 않기 때문에
 여러 개의 View가 하나의 ViewModel을 참조할 수 있다
 */
class HomeViewModel {
  final PhotoApiRepository repository;
  final _photoStreamController = StreamController<List<Photo>>()..add([]);

  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
