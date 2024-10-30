import 'package:flutter/material.dart';
import 'notes_list.dart';
import 'add_edit_note.dart';
import 'note_details.dart';

void main() => runApp(SimpleNotesApp());

class SimpleNotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesList(),
      routes: {
        '/addEdit': (context) => AddEditNote(),
        '/details': (context) => NoteDetails(),
      },
    );
  }
}
