import 'package:image_searcher/data/photo_api_repository.dart';
import 'package:image_searcher/model/photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PixabayApi implements PhotoApiRepository {

  final baseUrl = 'https://pixabay.com/api/';
  final key = '43317620-e964699fb593e865af79eae08';

  @override
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo',
      ),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

