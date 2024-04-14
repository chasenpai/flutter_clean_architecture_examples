import 'package:flutter/material.dart';
import 'package:note/ui/colors.dart';

class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  Color _color = roseBud;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300,),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        color: _color,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: noteColors
                    .map(
                      (e) => _renderBackGroundColor(
                        color: e,
                        selected: _color == e,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _titleController,
                maxLines: 1,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: darkGray,
                    ),
                decoration: const InputDecoration(
                  hintText: 'enter a title',
                  border: InputBorder.none,
                ),
              ),
              TextField(
                controller: _contentController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: darkGray,
                    ),
                decoration: const InputDecoration(
                  hintText: 'enter a content',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }

  Widget _renderBackGroundColor({
    required Color color,
    required bool selected,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _color = color;
        });
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6.0,
              spreadRadius: 1.0,
            ),
          ],
          border: selected
              ? Border.all(
                  color: Colors.black,
                  width: 3.0,
                )
              : null,
        ),
      ),
    );
  }
}
