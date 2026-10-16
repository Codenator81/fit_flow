import 'package:fit_flow/core/error/failures.dart';
import 'package:fit_flow/features/workouts/domain/entities/workout.dart';
import 'package:fit_flow/features/workouts/presentation/bloc/workout_bloc.dart';
import 'package:fit_flow/features/workouts/presentation/bloc/workout_event.dart';
import 'package:fit_flow/features/workouts/presentation/bloc/workout_state.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fakes/fake_workout_repository.dart';

Workout _workout(String id, String name) => Workout(
  id: id,
  userId: 'u1',
  name: name,
  days: const [],
  createdAt: DateTime.utc(2026, 1, 1),
  updatedAt: DateTime.utc(2026, 1, 1),
);

void main() {
  late FakeWorkoutRepository repository;
  late WorkoutBloc bloc;
  final existing = _workout('w1', 'Full body');

  setUp(() {
    repository = FakeWorkoutRepository()..workouts = [existing];
    bloc = WorkoutBloc(repository);
  });

  tearDown(() => bloc.close());

  test('starts in the initial state', () {
    expect(bloc.state, const WorkoutState.initial());
  });

  group('loadWorkouts', () {
    test('emits loading then loaded with the repository data', () {
      bloc.add(const WorkoutEvent.loadWorkouts());

      expect(
        bloc.stream,
        emitsInOrder([
          const WorkoutState.loading(),
          WorkoutState.loaded([existing]),
        ]),
      );
    });

    test('emits loading then error with the failure message', () {
      repository.failure = const ServerFailure('offline');
      bloc.add(const WorkoutEvent.loadWorkouts());

      expect(
        bloc.stream,
        emitsInOrder([
          const WorkoutState.loading(),
          const WorkoutState.error('offline'),
        ]),
      );
    });
  });

  group('createWorkout', () {
    test('reloads the list after a successful create', () async {
      bloc.add(const WorkoutEvent.createWorkout('Push day'));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const WorkoutState.loading(),
          isA<WorkoutLoaded>().having((s) => s.workouts.length, 'count', 2),
        ]),
      );
      expect(repository.calls, ['createWorkout:Push day', 'getWorkouts']);
    });

    test('emits error and does not reload on failure', () async {
      repository.failure = const AuthFailure('Not authenticated');
      bloc.add(const WorkoutEvent.createWorkout('Push day'));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const WorkoutState.loading(),
          const WorkoutState.error('Not authenticated'),
        ]),
      );
      expect(repository.calls, ['createWorkout:Push day']);
    });
  });

  test('deleteWorkout reloads the list without the deleted workout', () async {
    bloc.add(const WorkoutEvent.deleteWorkout('w1'));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const WorkoutState.loading(),
        const WorkoutState.loaded([]),
      ]),
    );
  });

  test('loadWorkoutDetail emits the single workout', () {
    bloc.add(const WorkoutEvent.loadWorkoutDetail('w1'));

    expect(
      bloc.stream,
      emitsInOrder([
        const WorkoutState.loading(),
        WorkoutState.detail(existing),
      ]),
    );
  });

  group('day and exercise edits', () {
    final cases = <String, (WorkoutEvent, String)>{
      'addDay': (
        const WorkoutEvent.addDay(
          workoutId: 'w1',
          dayName: 'Rest',
          isRestDay: true,
        ),
        'addDay:w1:Rest:true',
      ),
      'deleteDay': (
        const WorkoutEvent.deleteDay(workoutId: 'w1', dayId: 'd1'),
        'deleteDay:w1:d1',
      ),
      'addExercise': (
        const WorkoutEvent.addExercise(
          workoutId: 'w1',
          dayId: 'd1',
          exerciseName: 'Squat',
          sets: 3,
          reps: 10,
          restSeconds: 90,
        ),
        'addExercise:w1:d1:Squat:3:10:90',
      ),
      'completeDay': (
        const WorkoutEvent.completeDay(
          workoutId: 'w1',
          dayId: 'd1',
          exerciseProgress: {
            'e1': {'sets': 3, 'reps': 10},
          },
        ),
        'completeDay:w1:d1:1',
      ),
      'markRestDayComplete': (
        const WorkoutEvent.markRestDayComplete(workoutId: 'w1', dayId: 'd2'),
        'markRestDayComplete:w1:d2',
      ),
      'resetWorkout': (
        const WorkoutEvent.resetWorkout('w1'),
        'resetWorkout:w1',
      ),
      'setActiveDay': (
        const WorkoutEvent.setActiveDay(workoutId: 'w1', dayId: 'd1'),
        'setActiveDay:w1:d1',
      ),
    };

    for (final MapEntry(key: name, value: (event, call)) in cases.entries) {
      test('$name forwards args and reloads the workout detail', () async {
        bloc.add(event);

        await expectLater(
          bloc.stream,
          emitsInOrder([
            const WorkoutState.loading(),
            WorkoutState.detail(existing),
          ]),
        );
        expect(repository.calls, [call, 'getWorkout:w1']);
      });

      test('$name emits error and skips the reload on failure', () async {
        repository.failure = const ServerFailure('write failed');
        bloc.add(event);

        await expectLater(
          bloc.stream,
          emits(const WorkoutState.error('write failed')),
        );
        expect(repository.calls, [call]);
      });
    }
  });
}
