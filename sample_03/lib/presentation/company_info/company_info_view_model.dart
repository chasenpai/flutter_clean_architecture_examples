import 'package:flutter/material.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_info/company_info_state.dart';

class CompanyInfoViewModel with ChangeNotifier {
  final StockRepository _repository;
  var _state = const CompanyInfoState();

  CompanyInfoState get state => _state;

  CompanyInfoViewModel(this._repository, String symbol) {
    loadCompanyInfo(symbol);
  }

  Future<void> loadCompanyInfo(String symbol) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _repository.getCompanyInfo(symbol);
    result.when(
      success: (info) {
        _state = state.copyWith(
          companyInfo: info,
          isLoading: false,
          errorMsg: null,
        );
      },
      error: (e) {
        _state = state.copyWith(
          companyInfo: null,
          isLoading: false,
          errorMsg: e.toString(),
        );
      },
    );
    notifyListeners();

    final intradayInfo = await _repository.getIntradayInfo(symbol);
    intradayInfo.when(
      success: (infos) {
        _state = state.copyWith(
          stockInfos: infos,
          isLoading: false,
          errorMsg: null,
        );
      },
      error: (e) {
        _state = state.copyWith(
          stockInfos: [],
          isLoading: false,
          errorMsg: e.toString(),
        );
      },
    );
    notifyListeners();
  }
}
