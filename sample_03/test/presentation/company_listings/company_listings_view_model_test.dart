import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:us_stock/data/repository/stock_repository_impl.dart';
import 'package:us_stock/data/source/local/company_listing_entity.dart';
import 'package:us_stock/data/source/local/stock_dao.dart';
import 'package:us_stock/data/source/remote/stock_api.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';

void main() {
  test('create view model', () async {
    Hive.init(null);
    Hive.registerAdapter(CompanyListingEntityAdapter());
    final _api = StockApi();
    final _dao = StockDao();
    final viewModel = CompanyListingsViewModel(StockRepositoryImpl(_api, _dao));
    await Future.delayed(const Duration(seconds: 3));
    expect(viewModel.state.companies.isNotEmpty, true);
  });
}