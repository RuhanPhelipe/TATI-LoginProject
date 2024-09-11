import 'package:tati0814/datasource/user_repository_contract.dart';
import 'package:tati0814/domain/usecase/use_case_contract.dart';
import 'package:tati0814/presentation/state/user_state.dart';

class SignInParams {
  final String login;
  final String password;

  SignInParams({
    required this.login,
    required this.password,
  });
}

class SinginUseCaseImpl implements IUseCase<UserState, SignInParams> {
  final IUserRepository _repository;

  SinginUseCaseImpl({
    required IUserRepository repository,
  }) : _repository = repository;

  @override
  Future<UserState> call(SignInParams params) {
    return _repository.singIn(params.login, params.password);
  }
}
