import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/models/note.dart';
import 'package:flutterNotes/screens/note/note_show.dart';
import 'package:flutterNotes/utils/color_from_string.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard({this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, NoteShow.routeName, arguments: this.note)
      },
      child: Card(
        color: colorFromString(this.note.color),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(this.note.title),
              subtitle: Text(this.note.text),
            ),
            ButtonBar(
              children: [
                Text(this.note.createdAt.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
