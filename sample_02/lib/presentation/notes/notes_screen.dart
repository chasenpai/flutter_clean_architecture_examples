import 'package:flutter/material.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note/presentation/notes/component/note_item.dart';
import 'package:note/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Note',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(
              Icons.sort,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: 'title 1',
                content: 'content 1',
                color: wisteria.value,
                timestamp: 1,
              ),
            ),
            NoteItem(
              note: Note(
                title: 'title 2',
                content: 'content 2',
                color: primrose.value,
                timestamp: 2,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddEditNoteScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
