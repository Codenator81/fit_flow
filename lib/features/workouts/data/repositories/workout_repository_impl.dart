import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/workout.dart';
import '../../domain/repositories/workout_repository.dart';
import '../models/workout_model.dart';

class WorkoutRepositoryImpl implements WorkoutRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  WorkoutRepositoryImpl({required this.firestore, required this.auth});

  String get _userId {
    final user = auth.currentUser;
    if (user == null) throw Exception('User not authenticated');
    return user.uid;
  }

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() async {
    try {
      final snapshot = await firestore
          .collection('workouts')
          .where('userId', isEqualTo: _userId)
          .orderBy('createdAt', descending: true)
          .get();

      final workouts = snapshot.docs
          .map(
            (doc) =>
                WorkoutModel.fromJson({'id': doc.id, ...doc.data()}).toEntity(),
          )
          .toList();

      return Right(workouts);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch workouts'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workout>> getWorkout(String id) async {
    try {
      final doc = await firestore.collection('workouts').doc(id).get();

      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final workout = WorkoutModel.fromJson({
        'id': doc.id,
        ...doc.data()!,
      }).toEntity();

      return Right(workout);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to fetch workout'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Workout>> createWorkout(String name) async {
    try {
      final now = DateTime.now();
      final workoutData = {
        'userId': _userId,
        'name': name,
        'days': [],
        'createdAt': now.toIso8601String(),
        'updatedAt': now.toIso8601String(),
      };

      final docRef = await firestore.collection('workouts').add(workoutData);
      final workout = WorkoutModel.fromJson({
        'id': docRef.id,
        ...workoutData,
      }).toEntity();

      return Right(workout);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to create workout'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteWorkout(String id) async {
    try {
      await firestore.collection('workouts').doc(id).delete();
      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to delete workout'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addDay(String workoutId, String dayName) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = (data['days'] as List?) ?? [];
      final dayNumber = days.length + 1;

      final newDay = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': dayName,
        'dayNumber': dayNumber,
        'exercises': [],
      };

      await firestore.collection('workouts').doc(workoutId).update({
        'days': FieldValue.arrayUnion([newDay]),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to add day'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addExercise(
    String workoutId,
    String dayId,
    String exerciseName,
    int sets,
    int reps,
  ) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = List<Map<String, dynamic>>.from(data['days'] ?? []);
      final dayIndex = days.indexWhere((d) => d['id'] == dayId);

      if (dayIndex == -1) {
        return const Left(ServerFailure('Day not found'));
      }

      final newExercise = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': exerciseName,
        'expectedSets': sets,
        'expectedReps': reps,
        'completedSets': 0,
        'completedReps': 0,
      };

      final exercises = List<Map<String, dynamic>>.from(
        days[dayIndex]['exercises'] ?? [],
      );
      exercises.add(newExercise);
      days[dayIndex]['exercises'] = exercises;

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to add exercise'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateExerciseProgress(
    String workoutId,
    String dayId,
    String exerciseId,
    int completedSets,
    int completedReps,
  ) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = List<Map<String, dynamic>>.from(data['days'] ?? []);
      final dayIndex = days.indexWhere((d) => d['id'] == dayId);

      if (dayIndex == -1) {
        return const Left(ServerFailure('Day not found'));
      }

      final exercises = List<Map<String, dynamic>>.from(
        days[dayIndex]['exercises'] ?? [],
      );
      final exerciseIndex = exercises.indexWhere((e) => e['id'] == exerciseId);

      if (exerciseIndex == -1) {
        return const Left(ServerFailure('Exercise not found'));
      }

      exercises[exerciseIndex]['completedSets'] = completedSets;
      exercises[exerciseIndex]['completedReps'] = completedReps;
      days[dayIndex]['exercises'] = exercises;

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to update progress'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
