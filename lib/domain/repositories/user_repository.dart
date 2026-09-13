import 'package:result_dart/result_dart.dart';

import '../entities.dart';

abstract interface class UserRepository {
  AsyncResult<User> getUser();

  AsyncResult<Unit> saveUser(User user);
}
