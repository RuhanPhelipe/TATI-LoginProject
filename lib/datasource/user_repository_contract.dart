import '../domain/entity/user.dart';
import '../presentation/state/user_state.dart';

abstract interface class IUserRepository {
  Future<UserState> singUp(User user);
  Future<UserState> singIn(String login, String password);
}
