import 'package:flutter/material.dart';

class NoteDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String note = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Note Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note),
      ),
    );
  }
}
