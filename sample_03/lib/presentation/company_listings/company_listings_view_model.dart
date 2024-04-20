import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_listings/company_listings_action.dart';
import 'package:us_stock/presentation/company_listings/company_listings_state.dart';

class CompanyListingsViewModel with ChangeNotifier {
  final StockRepository _repository;

  var _state = CompanyListingsState();
  CompanyListingsState get state => _state;

  Timer? _debounce;

  CompanyListingsViewModel(this._repository) {
    _getCompanyListings();
  }

  void onAction(CompanyListingsAction action) {
    action.when(
      refresh: () => _getCompanyListings(fetchFromRemote: true),
      search: (query) {
        //순수 Dart로 디바운싱
        _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          _getCompanyListings(query: query);
        });
      },
    );
  }

  Future<void> _getCompanyListings({
    bool fetchFromRemote = false,
    String query = '',
  }) async {
    _state = state.copyWith(
      isLoading: true,
    );
    notifyListeners();

    final result = await _repository.getCompanyListings(
      fetchFromRemote,
      query,
    );
    result.when(
      success: (listings) {
        _state = state.copyWith(
          companies: listings,
        );
      },
      error: (e) {
        print('remote error : $e.toString()');
      },
    );

    _state = state.copyWith(
      isLoading: false,
    );
    notifyListeners();
  }
}