class User {
  int _id;
  String _name;
  String _email;

  User.fromJson(Map<String, dynamic> userJson)
      : this._id = userJson['id'],
        this._name = userJson['name'],
        this._email = userJson['email'];

  @override
  String toString() {
    return 'User{_id: $_id, _name: $_name, _email: $_email}';
  }
}
