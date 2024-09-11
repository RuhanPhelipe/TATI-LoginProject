import 'package:tati0814/common/errors/errors_classes.dart';

sealed class UserState {
  const UserState();
}

class InitialState extends UserState {}

final class SucessState<User> implements UserState {
  const SucessState(this.value);
  final User value;
}

final class ErrorState<User> implements UserState {
  const ErrorState(this.failure);
  final Failure failure;
}
