import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/domain/model/company_info.dart';
import 'package:us_stock/presentation/company_info/company_info_state.dart';
import 'package:us_stock/presentation/company_info/company_info_view_model.dart';
import 'package:us_stock/presentation/company_info/component/stock_chart.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyInfoViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (state.errorMsg != null)
              Center(
                child: Text(state.errorMsg!),
              ),
            if (state.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (state.isLoading == false && state.errorMsg == null)
              _buildBody(
                state.companyInfo!,
                context,
                state,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(CompanyInfo info, BuildContext context, CompanyInfoState state) {
    TextStyle style = TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info.name,
            style: style.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          Text(
            info.symbol,
            style: style.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
          const Divider(),
          Text(
            'Industry: ${info.industry}',
            style: style,
          ),
          Text(
            'Country: ${info.country}',
            style: style,
          ),
          const Divider(),
          Text(
            info.description,
            style: style,
          ),
          const SizedBox(height: 24.0,),
          Text(
            'Market Summery',
            style: style.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 16.0,),
          if(state.stockInfos.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StockChart(
                infos: state.stockInfos,
              ),
            ),
        ],
      ),
    );
  }
}
