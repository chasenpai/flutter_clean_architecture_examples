import 'package:flutter_test/flutter_test.dart';
import 'package:image_searcher/data/photo_api_repository.dart';
import 'package:image_searcher/model/photo.dart';
import 'package:image_searcher/ui/home_view_model.dart';

void main() {
  //테스트는 의존되는 객체에 의해 결과가 달라지면 안된다
  test('Stream is working', () async {
    final viewModel = HomeViewModel(DummyPhotoApiRepository());
    await viewModel.fetch('test');
    final result = dummyJson.map((e) => Photo.fromJson(e)).toList();
    expect(viewModel.photos, result);
  });
}

class DummyPhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return dummyJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> dummyJson = [
  {
    "id": 8595521,
    "pageURL": "https://pixabay.com/photos/forsythia-flowers-branch-8595521/",
    "type": "photo",
    "tags": "forsythia, flowers, branch",
    "previewURL": "https://cdn.pixabay.com/photo/2024/02/25/10/11/forsythia-8595521_150.jpg",
    "previewWidth": 112,
    "previewHeight": 150,
    "webformatURL": "https://pixabay.com/get/g4a4677717bc735669ee7075c3f074e77aea1e1a7f7175cbf203ca3902e976d6712a3fe1ecde1944cc86b837adcee7746502db82ed07084f5afb82eea80b0a525_640.jpg",
    "webformatWidth": 480,
    "webformatHeight": 640,
    "largeImageURL": "https://pixabay.com/get/g2326aeac0e27dd2ebfdbe912bbac7e87730c49d6372e29e2625e7fee0d3bef5c212a7d7386edbff936d2ad5af8499aacec744e0c518397ca67e65738b342d8cb_1280.jpg",
    "imageWidth": 3024,
    "imageHeight": 4032,
    "imageSize": 970371,
    "views": 56971,
    "downloads": 46311,
    "collections": 198,
    "likes": 1035,
    "comments": 44,
    "user_id": 10328767,
    "user": "Mylene2401",
    "userImageURL": "https://cdn.pixabay.com/user/2020/08/02/06-54-24-533_250x250.jpeg"
  },
  {
    "id": 8515123,
    "pageURL": "https://pixabay.com/photos/bee-flower-yellow-apricot-apricot-8515123/",
    "type": "photo",
    "tags": "bee, flower, flower wallpaper",
    "previewURL": "https://cdn.pixabay.com/photo/2024/01/17/17/22/bee-8515123_150.jpg",
    "previewWidth": 99,
    "previewHeight": 150,
    "webformatURL": "https://pixabay.com/get/gd87a8e997344f79cac4607b12b390f6d6b5a545465ae7bad1f53b110919b8ca18572105e1b4288fb50394305326f0d7943c2d3bea276aca6963a569493a472f3_640.jpg",
    "webformatWidth": 424,
    "webformatHeight": 640,
    "largeImageURL": "https://pixabay.com/get/g640bfec1500e59c80708d184c05510b46ded25c436e21d8b946e804513e5168552e04b1c49dd66d46dfb72611326ce0fc6ef03ac17b717083192817253bd2bb1_1280.jpg",
    "imageWidth": 3264,
    "imageHeight": 4928,
    "imageSize": 2799308,
    "views": 7067,
    "downloads": 4945,
    "collections": 26,
    "likes": 107,
    "comments": 19,
    "user_id": 23329472,
    "user": "achildinthewood",
    "userImageURL": ""
  },
];