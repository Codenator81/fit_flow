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
  Future<Either<Failure, Unit>> addDay(String workoutId, String dayName, {bool isRestDay = false}) async {
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
        'isRestDay': isRestDay,
        'isCompleted': false,
        'isActive': false,
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
  Future<Either<Failure, Unit>> deleteDay(String workoutId, String dayId) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = List<Map<String, dynamic>>.from(data['days'] ?? []);

      // Remove the day with matching ID
      days.removeWhere((d) => d['id'] == dayId);

      // Update day numbers for remaining days
      for (var i = 0; i < days.length; i++) {
        days[i]['dayNumber'] = i + 1;
      }

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to delete day'));
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
    int restSeconds,
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
        'sets': sets,
        'reps': reps,
        'restSeconds': restSeconds,
        'history': [],
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
  Future<Either<Failure, Unit>> completeDay(
    String workoutId,
    String dayId,
    Map<String, Map<String, int>> exerciseProgress,
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

      // Update exercise history
      final exercises = List<Map<String, dynamic>>.from(
        days[dayIndex]['exercises'] ?? [],
      );

      for (var exercise in exercises) {
        final exerciseId = exercise['id'] as String;
        if (exerciseProgress.containsKey(exerciseId)) {
          final progress = exerciseProgress[exerciseId]!;
          final history = List<Map<String, dynamic>>.from(exercise['history'] ?? []);

          // Add new completion to history
          history.insert(0, {
            'date': DateTime.now().toIso8601String(),
            'maxSets': progress['sets'] ?? 0,
            'maxReps': progress['reps'] ?? 0,
          });

          // Keep only last 5 entries
          if (history.length > 5) {
            history.removeRange(5, history.length);
          }

          exercise['history'] = history;
        }
      }

      days[dayIndex]['exercises'] = exercises;

      // Mark day as completed
      days[dayIndex]['isCompleted'] = true;
      days[dayIndex]['isActive'] = false;
      days[dayIndex]['completedDate'] = DateTime.now().toIso8601String();

      // Mark next uncompleted day as active
      for (var i = 0; i < days.length; i++) {
        if (!(days[i]['isCompleted'] ?? false)) {
          days[i]['isActive'] = true;
          break;
        }
      }

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to complete day'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> markRestDayComplete(
    String workoutId,
    String dayId,
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

      // Mark rest day as completed
      days[dayIndex]['isCompleted'] = true;
      days[dayIndex]['isActive'] = false;
      days[dayIndex]['completedDate'] = DateTime.now().toIso8601String();

      // Mark next uncompleted day as active
      for (var i = 0; i < days.length; i++) {
        if (!(days[i]['isCompleted'] ?? false)) {
          days[i]['isActive'] = true;
          break;
        }
      }

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to mark rest day complete'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetWorkout(String workoutId) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = List<Map<String, dynamic>>.from(data['days'] ?? []);

      // Reset all days
      for (var i = 0; i < days.length; i++) {
        days[i]['isCompleted'] = false;
        days[i]['isActive'] = i == 0; // First day becomes active
        days[i]['completedDate'] = null;
      }

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to reset workout'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> setActiveDay(
    String workoutId,
    String dayId,
  ) async {
    try {
      final doc = await firestore.collection('workouts').doc(workoutId).get();
      if (!doc.exists) {
        return const Left(ServerFailure('Workout not found'));
      }

      final data = doc.data()!;
      final days = List<Map<String, dynamic>>.from(data['days'] ?? []);

      // Set all days to inactive, then set the selected day as active
      for (var i = 0; i < days.length; i++) {
        days[i]['isActive'] = days[i]['id'] == dayId;
        // Reset completion if setting this day as active
        if (days[i]['id'] == dayId) {
          days[i]['isCompleted'] = false;
          days[i]['completedDate'] = null;
        }
      }

      await firestore.collection('workouts').doc(workoutId).update({
        'days': days,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return const Right(unit);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message ?? 'Failed to set active day'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

}
