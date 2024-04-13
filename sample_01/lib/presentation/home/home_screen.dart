import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_searcher/presentation/home/home_view_model.dart';
import 'package:image_searcher/presentation/home/component/photo_widget.dart';
import 'package:provider/provider.dart';

//Presentation Layer
//View
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<HomeViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(
          showSnackBar: (message) {
            final snackBar = SnackBar(
              content: Text(
                message,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Searcher',
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    context.read<HomeViewModel>().fetch(_controller.text);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          //Consumer를 사용하여 성능 향상 - 하지만 트레이드 오프에 대한 고민(가독성 등)
          Consumer<HomeViewModel>(
            builder: (_, viewModel, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: viewModel.photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final photo = viewModel.photos[index];
                    return PhotoWidget(
                      photo: photo,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
