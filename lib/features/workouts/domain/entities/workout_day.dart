import 'package:equatable/equatable.dart';
import 'exercise.dart';

class WorkoutDay extends Equatable {
  final String id;
  final String name;
  final int dayNumber;
  final List<Exercise> exercises;

  const WorkoutDay({
    required this.id,
    required this.name,
    required this.dayNumber,
    required this.exercises,
  });

  WorkoutDay copyWith({
    String? id,
    String? name,
    int? dayNumber,
    List<Exercise>? exercises,
  }) {
    return WorkoutDay(
      id: id ?? this.id,
      name: name ?? this.name,
      dayNumber: dayNumber ?? this.dayNumber,
      exercises: exercises ?? this.exercises,
    );
  }

  @override
  List<Object?> get props => [id, name, dayNumber, exercises];
}
