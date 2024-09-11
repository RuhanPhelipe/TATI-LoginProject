import '../common/errors/errors_classes.dart';

import '../domain/entity/user.dart';

class UserFakeApiDatabase {
  late List<User> users;

  Future<void> signUp(User user) async {
    try {
      user = User(
          id: users.length + 1,
          login: user.login,
          name: user.name,
          email: user.email,
          cell: user.cell,
          password: user.password);

      users.add(user);
    } catch (e) {
      throw DefaultError(e.toString());
    }
  }

  Future<User> signIn(String login, String password) async {
    final filter = (login.trim().isNotEmpty && password.trim().isNotEmpty)
        ? (User d) => d.login == login.trim()
        : throw InvalidSearchText();

    final instance = _filterUser(filter: filter);

    if (instance == null) {
      if (instance!.password == password.trim()) {
        return instance;
      }
      throw UserWrongPassword();
    }

    throw UserNotFound();
  }

  User? _filterUser({required bool Function(User) filter}) {
    try {
      return users.firstWhere(filter);
    } catch (e) {
      return null;
    }
  }
}
