import 'package:equatable/equatable.dart';

class Exercise extends Equatable {
  final String id;
  final String name;
  final int expectedSets;
  final int expectedReps;
  final int completedSets;
  final int completedReps;

  const Exercise({
    required this.id,
    required this.name,
    required this.expectedSets,
    required this.expectedReps,
    this.completedSets = 0,
    this.completedReps = 0,
  });

  Exercise copyWith({
    String? id,
    String? name,
    int? expectedSets,
    int? expectedReps,
    int? completedSets,
    int? completedReps,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      expectedSets: expectedSets ?? this.expectedSets,
      expectedReps: expectedReps ?? this.expectedReps,
      completedSets: completedSets ?? this.completedSets,
      completedReps: completedReps ?? this.completedReps,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        expectedSets,
        expectedReps,
        completedSets,
        completedReps,
      ];
}
