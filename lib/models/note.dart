import 'dart:convert';

class Note {
  int id;
  String title;
  String text;
  bool isPublic;
  String color;
  DateTime createdAt;

  Note.fromJson(Map<String, dynamic> noteJson)
      : this.id = noteJson['id'],
        this.title = noteJson['title'],
        this.text = noteJson['text'],
        this.isPublic = noteJson['is_public'],
        this.color = noteJson['color'],
        this.createdAt = DateTime.parse(noteJson['created_at']);

  String toJson() {
    return jsonEncode({
      'id': this.id,
      'title': this.title,
      'text': this.text,
      'isPublic': this.isPublic,
      'color': this.color,
      'createdAt': this.createdAt,
    });
  }

  @override
  String toString() {
    return 'Note{id: $id, '
        'title: $title, '
        'text: $text, '
        'isPublic: $isPublic, '
        'color: $color, '
        'createdAt: $createdAt}';
  }
}
