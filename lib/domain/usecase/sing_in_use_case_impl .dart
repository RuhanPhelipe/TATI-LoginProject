import 'package:tatiloginproject/presentation/asp/user_atom.dart';

import '../../datasource/user_repository_contract.dart';
import '../usecase/use_case_contract.dart';

class SignInParams {
  final String login;
  final String password;

  SignInParams({
    required this.login,
    required this.password,
  });
}

class SinginUseCaseImpl implements IUseCase<UserStore, SignInParams> {
  final IUserRepository _repository;

  SinginUseCaseImpl({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserStore> call(SignInParams params) {
    return _repository.singIn(params.login, params.password);
  }
}
