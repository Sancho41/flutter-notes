import 'package:flutterNotes/models/note.dart';

class PaginatedNotesDTO {
  int currentPage;
  int lastPage;
  List<Note> notes = new List();


  PaginatedNotesDTO({this.currentPage, this.lastPage, this.notes});

  PaginatedNotesDTO.fromJson(Map<String, dynamic> notesJson) {
    this.currentPage = notesJson['current_page'];
    this.lastPage = notesJson['last_page'];
    for( dynamic item in notesJson['data'])
      this.notes.add(new Note.fromJson(item));
  }

  @override
  String toString() {
    return 'PaginatedNotesDTO{currentPage: $currentPage, lastPage: $lastPage, notes: $notes}';
  }
}