import 'package:flutter/material.dart';
import 'package:note/presentation/notes/notes_screen.dart';
import 'package:note/ui/colors.dart';

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
        primaryColor: Colors.white,
        backgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme: Theme.of(context).floatingActionButtonTheme.copyWith(
          backgroundColor: Colors.white,
          foregroundColor: darkGray,
        ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: darkGray,
          elevation: 0,
        ),
        useMaterial3: false,
      ),
      home: const NotesScreen(),
    );
  }
}