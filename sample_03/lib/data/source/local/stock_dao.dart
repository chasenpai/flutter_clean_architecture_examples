import 'package:hive_flutter/hive_flutter.dart';
import 'package:us_stock/data/source/local/company_listing_entity.dart';


class StockDao {

  static const companyListing = 'companyListing';
  final box = Hive.box('stock.db');

  Future<void> saveCompanyListings(List<CompanyListingEntity> entityList) async {
    await box.put(companyListing, entityList);
  }

  Future<void> clearCompanyListings() async {
    await box.clear();
  }

  Future<List<CompanyListingEntity>> findCompanyListing(String query) async {
    final List<CompanyListingEntity> list = await box.get(companyListing, defaultValue: []);
    return list.where(
      (e) => e.name.toLowerCase().contains(query.toLowerCase())
      || query.toUpperCase() == e.symbol
    ).toList();
  }
}