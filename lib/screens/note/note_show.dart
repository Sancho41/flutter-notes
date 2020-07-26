import 'package:flutter/material.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/models/note.dart';

class NoteShow extends StatelessWidget {
  static String routeName = '/note-show';

  @override
  Widget build(BuildContext context) {
    final Note note = ModalRoute.of(context).settings.arguments;

    return LayoutDefault(
      title: note.title,
      child: Text(note.text),
    );
  }
}
