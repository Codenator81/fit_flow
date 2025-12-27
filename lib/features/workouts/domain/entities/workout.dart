import 'package:equatable/equatable.dart';
import 'workout_day.dart';

class Workout extends Equatable {
  final String id;
  final String userId;
  final String name;
  final List<WorkoutDay> days;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Workout({
    required this.id,
    required this.userId,
    required this.name,
    required this.days,
    required this.createdAt,
    required this.updatedAt,
  });

  Workout copyWith({
    String? id,
    String? userId,
    String? name,
    List<WorkoutDay>? days,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Workout(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      days: days ?? this.days,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, userId, name, days, createdAt, updatedAt];
}
