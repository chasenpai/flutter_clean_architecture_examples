import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:us_stock/data/repository/stock_repository_impl.dart';
import 'package:us_stock/data/source/local/company_listing_entity.dart';
import 'package:us_stock/data/source/local/stock_dao.dart';
import 'package:us_stock/data/source/remote/stock_api.dart';
import 'package:us_stock/presentation/company_listings/company_listings_screen.dart';
import 'package:us_stock/presentation/company_listings/company_listings_view_model.dart';
import 'package:us_stock/util/color_schemes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CompanyListingEntityAdapter());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CompanyListingsViewModel(
            StockRepositoryImpl(
              StockApi(),
              StockDao(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const CompanyListingsScreen(),
    );
  }
}
