import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterNotes/components/note_card.dart';
import 'package:flutterNotes/dtos/paginated_notes.dart';
import 'package:flutterNotes/layouts/layout_default.dart';
import 'package:flutterNotes/models/note.dart';
import 'package:flutterNotes/services/note_service.dart';

class Home extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NoteService _service = new NoteService();

  String userName;

  @override
  Widget build(BuildContext context) {
    return LayoutDefault(
      title: 'Home',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder(
            future: this._service.publicNotes(context, page: 1, perPage: 10),
            builder: (BuildContext context,
                AsyncSnapshot<PaginatedNotesDTO> snapshot) {
              List<NoteCard> cardNotes = List();

              for (Note note in snapshot.data.notes)
                cardNotes.add(NoteCard(note: note));

              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return ListView(
                    children: cardNotes,
                  );
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
