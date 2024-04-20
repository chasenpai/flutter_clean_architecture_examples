import 'package:hive_flutter/hive_flutter.dart';
import 'package:us_stock/data/source/local/company_listing_entity.dart';


class StockDao {

  static const companyListing = 'companyListing';

  Future<void> saveCompanyListings(List<CompanyListingEntity> entities) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.addAll(entities);
  }

  Future<void> clearCompanyListings() async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    await box.clear();
  }

  Future<List<CompanyListingEntity>> findCompanyListing(String query) async {
    final box = await Hive.openBox<CompanyListingEntity>('stock.db');
    final List<CompanyListingEntity> list = box.values.toList();
    return list.where(
      (e) => e.name.toLowerCase().contains(query.toLowerCase())
      || query.toUpperCase() == e.symbol
    ).toList();
  }
}