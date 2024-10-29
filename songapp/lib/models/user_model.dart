class User {
  int? id;
  String name;
  String username;
  String password;
  String gender;
  String dob;

  User({this.id, required this.name, required this.username, required this.password, required this.gender, required this.dob});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'gender': gender,
      'dob': dob,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      password: map['password'],
      gender: map['gender'],
      dob: map['dob'],
    );
  }
}
