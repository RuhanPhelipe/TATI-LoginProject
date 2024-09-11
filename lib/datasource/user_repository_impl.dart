import 'package:tati0814/domain/entity/user.dart';
import 'package:tati0814/external/services/user_api_contract.dart';

import 'package:tati0814/presentation/state/user_state.dart';

import '../datasource/user_repository_contract.dart';

class UserRepositoryImpl implements IUserRepository {
  IUserApiService serviceApi;
  UserRepositoryImpl(this.serviceApi);

  @override
  Future<UserState> singIn(String login, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return serviceApi.singIn(login, password);
  }

  @override
  Future<UserState> singUp(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    return serviceApi.singUp(user);
  }
}
