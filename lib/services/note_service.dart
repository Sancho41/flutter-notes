import 'package:flutter/material.dart';
import 'package:flutterNotes/components/response_dialog.dart';
import 'package:flutterNotes/dtos/paginated_notes.dart';
import 'package:flutterNotes/http/webclients/note_webclient.dart';

class NoteService {
  final NoteWebclient _webclient = new NoteWebclient();

  Future<PaginatedNotesDTO> publicNotes(
    BuildContext context, {
    int page,
    int perPage,
  }) async {

    try {
      return this._webclient.publicNotes(
            page: page,
            perPage: perPage,
          );
    } catch (e) {
      await showDialog(
        context: context,
        builder: (contextDialog) => FailureDialog('Fill all fields!'),
      );
    }
  }
}
