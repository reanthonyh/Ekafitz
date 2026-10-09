// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allWorkouts)
final allWorkoutsProvider = AllWorkoutsProvider._();

final class AllWorkoutsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Workout>>,
          List<Workout>,
          FutureOr<List<Workout>>
        >
    with $FutureModifier<List<Workout>>, $FutureProvider<List<Workout>> {
  AllWorkoutsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allWorkoutsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allWorkoutsHash();

  @$internal
  @override
  $FutureProviderElement<List<Workout>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Workout>> create(Ref ref) {
    return allWorkouts(ref);
  }
}

String _$allWorkoutsHash() => r'671b49de2d8aa3874e02d6d8d6bf21fdf3522fea';

@ProviderFor(workout)
final workoutProvider = WorkoutFamily._();

final class WorkoutProvider
    extends $FunctionalProvider<AsyncValue<Workout>, Workout, FutureOr<Workout>>
    with $FutureModifier<Workout>, $FutureProvider<Workout> {
  WorkoutProvider._({
    required WorkoutFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'workoutProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$workoutHash();

  @override
  String toString() {
    return r'workoutProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Workout> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Workout> create(Ref ref) {
    final argument = this.argument as int;
    return workout(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WorkoutProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$workoutHash() => r'03935cfbbdc4cc59be272e0c996b0ab83cd23f0a';

final class WorkoutFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Workout>, int> {
  WorkoutFamily._()
    : super(
        retry: null,
        name: r'workoutProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WorkoutProvider call(int id) => WorkoutProvider._(argument: id, from: this);

  @override
  String toString() => r'workoutProvider';
}
