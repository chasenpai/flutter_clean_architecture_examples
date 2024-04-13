import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:image_searcher/domain/use_case/get_photos_use_case.dart';
import 'package:image_searcher/presentation/home/home_state.dart';
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
  final GetPhotosUseCase useCase;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  //ViewModel 내부에서 외부로 공개되는 데이터들은 다 읽기 전용으로 만들자
  HomeState _state = const HomeState([], false);
  HomeState get state => _state;

  HomeViewModel(this.useCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await useCase(query);
    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
