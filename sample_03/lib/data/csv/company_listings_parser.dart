import 'package:us_stock/data/csv/csv_parser.dart';
import 'package:us_stock/domain/model/company_listing.dart';
import 'package:csv/csv.dart';

class CompanyListingsParser implements CsvParser<CompanyListing> {

  @override
  Future<List<CompanyListing>> parse(String csvString) async {
    List<List<dynamic>> csvValues = const CsvToListConverter().convert(csvString);
    csvValues.removeAt(0);
    return csvValues.map((e) {
      final symbol = e[0] ?? '';
      final name = e[1] ?? '';
      final exchange = e[2] ?? '';
      return CompanyListing(
        symbol: symbol,
        name: name,
        exchange: exchange,
      );
    }).where(
      (e) =>
        e.symbol.isNotEmpty
        && e.name.isNotEmpty
        && e.exchange.isNotEmpty
    ).toList();
  }
}