import 'dart:convert';

import 'package:http/http.dart' as http;

//Date Layer
//- Data Source(Pixabay Api)
class PixabayApi {
  final http.Client client;
  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '43317620-e964699fb593e865af79eae08';

  PixabayApi(this.client);

  Future<Iterable> fetch(String query) async {
    final response = await client.get(
      Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo',
      ),
    );
    //흠.. Data Source는 순수한 응답만 제공해야 하지 않을까..
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson['hits'];
  }
}
