class User {
  final int? id;
  final String login;
  final String name;
  final String email;
  final String cell;
  final String password;

  User({
    this.id,
    required this.login,
    required this.name,
    required this.email,
    required this.cell,
    required this.password,
  });

  User copyWith({
    int? id,
    String? login,
    String? name,
    String? email,
    String? cell,
    String? password,
  }) {
    return User(
      id: this.id, 
      login: this.login, 
      name: this.name, 
      email: this.email, 
      cell: this.cell, 
      password: this.password,
    );
  }

  @override
  String toString() {
    return '$login [name: $name, email: $email, cell: $cell, password: $password]';
  }
}
