import '../../common/errors/errors_classes.dart';
import '../../domain/entity/user.dart';
import '../../helper/user_fake_repository.dart';
import '../../presentation/state/user_state.dart';

import 'user_api_contract.dart';

class UserServiceApiImpl implements IUserApiService {
  UserFakeApiDatabase api;

  UserServiceApiImpl(this.api);

  @override
  Future<UserState> singIn(String login, String password) async {
    try {
      var result = await api.signIn(login, password);
      return SucessState(result);
    } on InvalidSearchText catch (e) {
      return ErrorState(e);
    } on UserNotFound catch (e) {
      return ErrorState(e);
    } on UserWrongPassword catch (e) {
      return ErrorState(e);
    }
  }

  @override
  Future<UserState> singUp(User user) async {
    try {
      var result = await api.signUp(user);
      return SucessState(result);
    } on DefaultError catch (e) {
      return ErrorState(e);
    }
  }
}
