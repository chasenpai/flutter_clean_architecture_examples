import 'package:flutter/cupertino.dart';
import 'package:image_searcher/data/api.dart';

class PhotoProvider extends InheritedWidget { //원하는 위젯트리에 원하는 객체를 전달할 수 있게 해준다
  final PixabayApi pixabayApi;

  const PhotoProvider({
    required this.pixabayApi,
    required super.child,
    super.key,
  });

  //PhotoProvider를 언제 어디서든 얻을 수 있다
  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'PixabayApi not found in context');
    return result!;
  }

  //PixabayApi가 변경되면 다시 전달
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.pixabayApi != pixabayApi;
  }
}
