import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_searcher/data/data_source/result.dart';

//Date Layer
//Data Source(Pixabay Api) - 실질적인 데이터를 제공
class PixabayApi {
  final http.Client client;
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '43317620-e964699fb593e865af79eae08';

  PixabayApi(this.client);

  Future<Result<Iterable>> fetch(String query) async {
    try{
      final response = await client.get(
        Uri.parse(
          '$baseUrl?key=$key&q=$query&image_type=photo',
        ),
      );
      //흠.. Data Source는 순수한 응답만 제공해야 하지 않을까..
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      Iterable hits = decodedJson['hits'];
      return Result.success(hits);
    }catch (e) {
      return const Result.error('서버와 연결이 ...');
    }
  }
}
