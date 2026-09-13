import 'package:ekafitz/domain/entities.dart' show User;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const GetUserUseCase({required this._repository}) {
  final UserRepository _repository;

  Future<User> call({required String userId}) =>
      _repository.getUser().getOrThrow();
}
