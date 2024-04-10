import 'package:flutter/material.dart';
import 'package:image_searcher/data/pixabay_api.dart';
import 'package:image_searcher/data/photo_provider.dart';
import 'package:image_searcher/model/photo.dart';
import 'package:image_searcher/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = PhotoProvider.of(context).viewModel;
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
                    viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
            stream: viewModel.photoStream,
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final photos = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemBuilder: (context, index) {
                    final photo = photos[index];
                    return PhotoWidget(
                      photo: photo,
                    );
                  },
                ),
              );
            }
          ),
        ],
      ),
    );
  }
}
