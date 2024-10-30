import 'package:flutter/material.dart';

class NotesList extends StatefulWidget {
  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<String> notes = [];

  void _deleteNoteAt(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  void _editNoteAt(int index) async {
    final updatedNote = await Navigator.pushNamed(context, '/addEdit', arguments: notes[index]);
    if (updatedNote != null) {
      setState(() {
        notes[index] = updatedNote as String;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: notes[index]);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => _editNoteAt(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteNoteAt(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.pushNamed(context, '/addEdit');
          if (newNote != null) {
            setState(() {
              notes.add(newNote as String);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
