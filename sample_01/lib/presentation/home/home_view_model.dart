import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:image_searcher/domain/repository/photo_api_repository.dart';
import 'package:image_searcher/domain/model/photo.dart';
import 'package:image_searcher/presentation/home/home_ui_event.dart';

/*
 MVVM - ViewModel
 View에서 사용자의 입력을 ViewModel로 전달하고
 ViewModel에서 Model로 데이터 요청 및 처리
 View는 Provider나 Stream 등을 통한 상태관리를 통해 View를
 ViewModel은 View에 의존하지 않기 때문에
 여러 개의 View가 하나의 ViewModel을 참조할 수 있다
 */
//Presentation Layer
//ViewModel - Use Case를 활용해 View에 데이터를 표현
class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];
  UnmodifiableListView<Photo> get photos =>
      UnmodifiableListView(_photos); //수정 불가 리스트

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners(); //watch하고있는 곳에 알려준다
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
  }
}
