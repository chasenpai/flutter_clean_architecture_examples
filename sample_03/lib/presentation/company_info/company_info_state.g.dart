// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyInfoStateImpl _$$CompanyInfoStateImplFromJson(
        Map<String, dynamic> json) =>
    _$CompanyInfoStateImpl(
      companyInfo: json['companyInfo'] == null
          ? null
          : CompanyInfo.fromJson(json['companyInfo'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
      errorMsg: json['errorMsg'] as String?,
      stockInfos: (json['stockInfos'] as List<dynamic>?)
              ?.map((e) => IntradayInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CompanyInfoStateImplToJson(
        _$CompanyInfoStateImpl instance) =>
    <String, dynamic>{
      'companyInfo': instance.companyInfo,
      'isLoading': instance.isLoading,
      'errorMsg': instance.errorMsg,
      'stockInfos': instance.stockInfos,
    };
