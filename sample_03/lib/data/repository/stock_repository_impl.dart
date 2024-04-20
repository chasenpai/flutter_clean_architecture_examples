import 'package:us_stock/data/mapper/company_mapper.dart';
import 'package:us_stock/data/source/local/stock_dao.dart';
import 'package:us_stock/data/source/remote/stock_api.dart';
import 'package:us_stock/domain/model/company_listing.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/util/result.dart';

class StockRepositoryImpl implements StockRepository {
  final StockApi _api;
  final StockDao _dao;


  StockRepositoryImpl(this._api, this._dao);

  @override
  Future<Result<List<CompanyListing>>> getCompanyListings(bool fetchFromRemote, String query) async {
    //캐시에서 찾고
    final localListings = await _dao.findCompanyListing(query);
    //없으면 리모트에서
    final isDbEmpty = localListings.isEmpty && query.isEmpty;
    final isLoadFromCache = !isDbEmpty && !fetchFromRemote;

    //캐시
    if(isLoadFromCache) {
      return Result.success(localListings.map((e) => e.toCompanyListing()).toList());
    }
    //리모트
    try{
      final remoteListing = await _api.getListings();
      return Result.success([]);
    }catch(e) {
      return Result.error(Exception('data load failed..'));
    }
  }
}