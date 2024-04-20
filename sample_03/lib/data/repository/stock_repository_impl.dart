import 'package:us_stock/data/csv/company_listings_parser.dart';
import 'package:us_stock/data/mapper/company_mapper.dart';
import 'package:us_stock/data/source/local/stock_dao.dart';
import 'package:us_stock/data/source/remote/stock_api.dart';
import 'package:us_stock/domain/model/company_listing.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;
  final _parser = CompanyListingsParser();

  StockRepositoryImpl(this._api, this._dao);

  @override
  Future<Result<List<CompanyListing>>> getCompanyListings(
    bool fetchFromRemote,
    String query,
  ) async {
    //캐시에서 찾고
    final localListings = await _dao.findCompanyListing(query);
    //없으면 리모트에서
    final isDbEmpty = localListings.isEmpty && query.isEmpty;
    final isLoadFromCache = !isDbEmpty && !fetchFromRemote;

    //캐시
    if(isLoadFromCache) {
      return Result.success(
        localListings.map((e) => e.toCompanyListing()).toList(),
      );
    }
    //리모트
    try{
      final response = await _api.getListings();
      //svc 파싱
      final remoteListings = await _parser.parse(response.body);
      //캐시 비우고
      await _dao.clearCompanyListings();
      //캐싱
      await _dao.saveCompanyListings(
        remoteListings.map((e) => e.toCompanyListingEntity()).toList(),
      );
      return Result.success(remoteListings);
    }catch(e) {
      return Result.error(Exception('data load failed..'));
    }
  }
}