
import '../domain/entity/user.dart';
import '../external/services/user_api_contract.dart';

import '../presentation/asp/user_atom.dart';

import 'user_repository_contract.dart';

class UserRepositoryImpl implements IUserRepository {
  IUserApiService serviceApi;
  UserRepositoryImpl(this.serviceApi);

  @override
  Future<UserStore> singIn(String login, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return serviceApi.singIn(login, password);
  }

  @override
  Future<UserStore> singUp(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    return serviceApi.singUp(user);
  }
}
