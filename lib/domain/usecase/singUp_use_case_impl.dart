import 'package:tati0814/datasource/user_repository_contract.dart';
import '../entity/user.dart';
import 'package:tati0814/presentation/state/user_state.dart';

import 'use_case_contract.dart';

class SignUpParams {
  final User user;

  const SignUpParams({
    required this.user,
  });
}

class SignUpUseCaseImpl implements IUseCase<UserState, SignUpParams> {
  final IUserRepository _repository;

  SignUpUseCaseImpl({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserState> call(SignUpParams params) {
    return _repository.singUp(params.user);
  }
}
