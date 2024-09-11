import '../../domain/entity/user.dart';
import '../../presentation/state/user_list_state.dart';
import '../../presentation/state/user_state.dart';

abstract interface class IUserApiService {
  Future<UserState> singUp(User user);
  Future<UserState> singIn(String login, String password);
}

