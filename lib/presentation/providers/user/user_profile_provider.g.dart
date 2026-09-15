// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserFamily._();

final class CurrentUserProvider
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
  CurrentUserProvider._({
    required CurrentUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'currentUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @override
  String toString() {
    return r'currentUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    final argument = this.argument as String;
    return currentUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$currentUserHash() => r'b59ec5e1df1fefa6cec07739e6a2aea8c18b72e3';

final class CurrentUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<User>, String> {
  CurrentUserFamily._()
    : super(
        retry: null,
        name: r'currentUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CurrentUserProvider call(String id) =>
      CurrentUserProvider._(argument: id, from: this);

  @override
  String toString() => r'currentUserProvider';
}
