// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_program_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(allTrainingPrograms)
final allTrainingProgramsProvider = AllTrainingProgramsProvider._();

final class AllTrainingProgramsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TrainingProgram>>,
          List<TrainingProgram>,
          FutureOr<List<TrainingProgram>>
        >
    with
        $FutureModifier<List<TrainingProgram>>,
        $FutureProvider<List<TrainingProgram>> {
  AllTrainingProgramsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allTrainingProgramsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allTrainingProgramsHash();

  @$internal
  @override
  $FutureProviderElement<List<TrainingProgram>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TrainingProgram>> create(Ref ref) {
    return allTrainingPrograms(ref);
  }
}

String _$allTrainingProgramsHash() =>
    r'abb7bf86c3d235752e1e5c3536ee940fc5c0c22b';

@ProviderFor(trainingProgram)
final trainingProgramProvider = TrainingProgramFamily._();

final class TrainingProgramProvider
    extends
        $FunctionalProvider<
          AsyncValue<TrainingProgram>,
          TrainingProgram,
          FutureOr<TrainingProgram>
        >
    with $FutureModifier<TrainingProgram>, $FutureProvider<TrainingProgram> {
  TrainingProgramProvider._({
    required TrainingProgramFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'trainingProgramProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$trainingProgramHash();

  @override
  String toString() {
    return r'trainingProgramProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TrainingProgram> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TrainingProgram> create(Ref ref) {
    final argument = this.argument as String;
    return trainingProgram(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingProgramProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$trainingProgramHash() => r'30514ecabb7e835926d7bcb622d0121899943aa9';

final class TrainingProgramFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TrainingProgram>, String> {
  TrainingProgramFamily._()
    : super(
        retry: null,
        name: r'trainingProgramProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TrainingProgramProvider call(String id) =>
      TrainingProgramProvider._(argument: id, from: this);

  @override
  String toString() => r'trainingProgramProvider';
}
