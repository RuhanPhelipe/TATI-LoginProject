
import '../../domain/entity/user.dart';
import '../../presentation/asp/user_atom.dart';

abstract interface class IUserApiService {
  Future<UserStore> singUp(User user);
  Future<UserStore> singIn(String login, String password);
}

