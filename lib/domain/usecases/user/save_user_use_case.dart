import 'package:ekafitz/domain/entities.dart' show User;
import 'package:ekafitz/domain/repositories.dart';
import 'package:result_dart/result_dart.dart';

final class const SaveUserUseCase({required this._repository}) {
  final UserRepository _repository;

  Future<void> call({required User user}) =>
      _repository.saveUser(user).getOrThrow();
}
