import 'package:ekafitz/domain/entities.dart';
import 'package:ekafitz/domain/usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_provider.g.dart';

@riverpod
Future<User> currentUser(Ref ref, String id) async {
  final useCase = GetIt.I<GetUserUseCase>();

  final resultUser = await useCase(userId: id);

  return resultUser;
}
