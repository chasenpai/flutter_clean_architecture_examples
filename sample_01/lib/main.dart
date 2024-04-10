import 'package:flutter/material.dart';
import 'package:image_searcher/data/api.dart';
import 'package:image_searcher/data/photo_provider.dart';
import 'package:image_searcher/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhotoProvider(
        pixabayApi: PixabayApi(), //PixabayApi 객체를 주입
        child: const HomeScreen(),
      ),
    );
  }
}
