import 'package:asp/asp.dart';
import '../../domain/entity/user.dart';

class UserStore {

  static final userLoadingAtom = atom(
    key: 'userLoading',
    true
  );

}