import 'package:flutter_test/flutter_test.dart';
import 'package:us_stock/data/csv/company_listings_parser.dart';
import 'package:us_stock/data/source/remote/stock_api.dart';

void main() {
  test('api connection test', () async {
    final response = await StockApi().getListings();
    final parser = CompanyListingsParser();
    final remoteListings = await parser.parse(response.body);
    expect(remoteListings[0].symbol, 'A');
    expect(remoteListings[0].name, 'Agilent Technologies Inc');
    expect(remoteListings[0].exchange, 'NYSE');
  });
}