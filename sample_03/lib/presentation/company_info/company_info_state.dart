import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:us_stock/domain/model/company_info.dart';

part 'company_info_state.freezed.dart';
part 'company_info_state.g.dart';

@freezed
class CompanyInfoState with _$CompanyInfoState {
  const factory CompanyInfoState({
    CompanyInfo? companyInfo,
    @Default(false) bool isLoading,
    String? errorMsg,
  }) = _CompanyInfoState;

  factory CompanyInfoState.fromJson(Map<String, dynamic> json) => _$CompanyInfoStateFromJson(json);
}