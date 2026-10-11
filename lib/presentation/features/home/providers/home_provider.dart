import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
Future<void> homeState(Ref ref) {
  return Future.delayed(Duration(seconds: 2), () => null);
}
