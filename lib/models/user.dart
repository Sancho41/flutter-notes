import 'dart:convert';

class User {
  int id;
  String name;
  String email;

  User.fromJson(Map<String, dynamic> userJson)
      : this.id = userJson['id'],
        this.name = userJson['name'],
        this.email = userJson['email'];

  String toJson() {
    return jsonEncode({
      'id': this.id,
      'email': this.email,
      'name': this.name,
    });
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email}';
  }
}
