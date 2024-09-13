import 'package:tatiloginproject/presentation/asp/user_atom.dart';

import '../../datasource/user_repository_contract.dart';
import '../entity/user.dart';

import 'use_case_contract.dart';

class SignUpParams {
  final User user;

  const SignUpParams({
    required this.user,
  });
}

class SignUpUseCaseImpl implements IUseCase<UserStore, SignUpParams> {
  final IUserRepository _repository;

  SignUpUseCaseImpl({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserStore> call(SignUpParams params) {
    return _repository.singUp(params.user);
  }
}
