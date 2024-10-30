import 'package:flutter/material.dart';

class AddEditNote extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String? note = ModalRoute.of(context)!.settings.arguments as String?;
    if (note != null) {
      _controller.text = note;  // Pre-fill the text field if editing
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text); // Return the entered text
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
