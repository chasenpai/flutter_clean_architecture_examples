import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/domain/repository/stock_repository.dart';
import 'package:us_stock/presentation/company_info/company_info_screen.dart';
import 'package:us_stock/presentation/company_info/company_info_view_model.dart';
import 'package:us_stock/presentation/company_listings/company_listings_action.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';

class CompanyListingsScreen extends StatelessWidget {
  const CompanyListingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyListingsViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (query) {
                  viewModel.onAction(CompanyListingsAction.search(query));
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  labelText: 'search...',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  viewModel.onAction(const CompanyListingsAction.refresh());
                },
                child: ListView.builder(
                    itemCount: state.companies.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              state.companies[index].name,
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  final repository = GetIt.instance<StockRepository>();
                                  final symbol = state.companies[index].symbol;
                                  return ChangeNotifierProvider(
                                    create: (_) => CompanyInfoViewModel(
                                      repository,
                                      symbol,
                                    ),
                                    child: const CompanyInfoScreen(),
                                  );
                                }),
                              );
                            },
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
