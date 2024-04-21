import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:us_stock/data/source/remote/dto/company_info_dto.dart';

class StockApi {
  static const baseUrl = 'https://www.alphavantage.co';
  static const apiKey = '0E3RDS9CF9WCP02H';
  final http.Client _client;

  StockApi({http.Client? client}) : _client = (client ?? http.Client());

  Future<http.Response> getListings({String apiKey = apiKey}) async {
    return await _client.get(
      Uri.parse(
        '$baseUrl/query?function=LISTING_STATUS&apikey=$apiKey',
      ),
    );
  }

  Future<CompanyInfoDto> getCompanyInfo({
    String apiKey = apiKey,
    required String symbol,
  }) async {
    final response = await _client.get(
      Uri.parse(
        '$baseUrl/query?function=OVERVIEW&symbol=$symbol&apikey=$apiKey',
      ),
    );
    return CompanyInfoDto.fromJson(jsonDecode(response.body));
  }

  Future<http.Response> getIntradayInfo({
    required String symbol,
    String apiKey = apiKey,
  }) async {
    return await _client.get(
      Uri.parse(
        '$baseUrl/query?function=TIME_SERIES_INTRADAY'
        '&symbol=$symbol&interval=60min'
        '&datatype=csv&apikey=$apiKey',
      ),
    );
  }
}
