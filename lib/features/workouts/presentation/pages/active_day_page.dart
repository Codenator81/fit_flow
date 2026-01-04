import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_day.dart';
import '../../domain/entities/exercise.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';

class ActiveDayPage extends StatefulWidget {
  final Workout workout;
  final WorkoutDay day;

  const ActiveDayPage({
    super.key,
    required this.workout,
    required this.day,
  });

  @override
  State<ActiveDayPage> createState() => _ActiveDayPageState();
}

class _ActiveDayPageState extends State<ActiveDayPage> {
  // Track reps for each set of each exercise
  // Map<exerciseId, List<reps for each set>>
  final Map<String, List<int>> _setReps = {};

  // Track completion status for each set
  // Map<exerciseId, List<bool for each set>>
  final Map<String, List<bool>> _setCompleted = {};

  // Track manual completion status for each exercise
  final Map<String, bool> _exerciseCompleted = {};

  @override
  void initState() {
    super.initState();
    // Initialize tracking - pre-fill with target sets and reps
    for (var exercise in widget.day.exercises) {
      _setReps[exercise.id] = List.generate(
        exercise.sets,
        (_) => exercise.reps,
      );
      _setCompleted[exercise.id] = List.generate(
        exercise.sets,
        (_) => false,
      );
      _exerciseCompleted[exercise.id] = false;
    }
  }

  void _checkExerciseCompletion(String exerciseId) {
    // Auto-complete exercise if all sets are complete
    final allSetsComplete = _setCompleted[exerciseId]?.every((completed) => completed) ?? false;
    if (allSetsComplete && (_setCompleted[exerciseId]?.isNotEmpty ?? false)) {
      setState(() {
        _exerciseCompleted[exerciseId] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Count manually completed exercises
    final completedExercises = _exerciseCompleted.values.where((completed) => completed).length;
    final totalExercises = widget.day.exercises.length;
    final progress = totalExercises > 0 ? completedExercises / totalExercises : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.day.name, style: AppTextStyles.h3),
        backgroundColor: AppColors.background,
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.gradientOrange,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.glowOrange.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Day ${widget.day.dayNumber}',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        Text(
                          widget.day.name,
                          style: AppTextStyles.h2.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$completedExercises / $totalExercises',
                        style: AppTextStyles.h3.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white.withValues(alpha: 0.3),
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            ),
          ),

          // Exercises List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: widget.day.exercises.length,
              itemBuilder: (context, index) {
                final exercise = widget.day.exercises[index];
                return _buildExerciseCard(context, exercise);
              },
            ),
          ),

          // Finish Day Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.gradientOrange,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.glowOrange.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: (completedExercises == totalExercises && totalExercises > 0) || widget.day.isRestDay
                    ? () => _finishDay(context)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  disabledBackgroundColor: AppColors.surface,
                ),
                icon: Icon(
                  Icons.check_circle,
                  color: ((completedExercises == totalExercises && totalExercises > 0) || widget.day.isRestDay) ? Colors.white : AppColors.textTertiary,
                ),
                label: Text(
                  'Finish Day',
                  style: AppTextStyles.button.copyWith(
                    color: ((completedExercises == totalExercises && totalExercises > 0) || widget.day.isRestDay) ? Colors.white : AppColors.textTertiary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseCard(BuildContext context, Exercise exercise) {
    final sets = _setReps[exercise.id] ?? [];
    final isCompleted = _exerciseCompleted[exercise.id] ?? false;

    return GestureDetector(
      onLongPress: () => _showHistory(context, exercise),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isCompleted
              ? AppColors.success.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isCompleted
                ? AppColors.success
                : AppColors.primary.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise Header with Timer and Completion Switch
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: AppTextStyles.h3.copyWith(
                          color: isCompleted ? AppColors.success : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Target: ${exercise.sets} sets × ${exercise.reps} reps',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                // Rest Timer Button
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () => _startRestTimer(context, exercise),
                    icon: const Icon(Icons.timer),
                    color: AppColors.primary,
                    tooltip: 'Start Rest Timer (${exercise.restSeconds}s)',
                  ),
                ),
                const SizedBox(width: 8),
                // Completion Switch
                Transform.scale(
                  scale: 1.2,
                  child: Switch(
                    value: isCompleted,
                    onChanged: (value) {
                      setState(() {
                        _exerciseCompleted[exercise.id] = value;
                        // When toggling exercise completion, toggle all sets
                        if (_setCompleted[exercise.id] != null) {
                          _setCompleted[exercise.id] = List.generate(
                            _setCompleted[exercise.id]!.length,
                            (_) => value,
                          );
                        }
                      });
                    },
                    activeThumbColor: AppColors.success,
                    activeTrackColor: AppColors.success.withValues(alpha: 0.5),
                    inactiveThumbColor: AppColors.textTertiary,
                    inactiveTrackColor: AppColors.surface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(color: AppColors.textTertiary),
            const SizedBox(height: 16),

            // Sets List
            ...List.generate(sets.length, (index) {
              return _buildSetRow(exercise, index);
            }),

            // Add Set Button
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _setReps[exercise.id]!.add(exercise.reps);
                    _setCompleted[exercise.id]!.add(false);
                  });
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.5),
                    width: 1,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add),
                label: Text(
                  'Add Set',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            // History hint
            if (exercise.history.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Long press to view history',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSetRow(Exercise exercise, int setIndex) {
    final sets = _setReps[exercise.id]!;
    final reps = sets[setIndex];
    final isSetCompleted = _setCompleted[exercise.id]![setIndex];

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSetCompleted
            ? AppColors.success.withValues(alpha: 0.15)
            : AppColors.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSetCompleted
              ? AppColors.success
              : AppColors.primary.withValues(alpha: 0.2),
          width: isSetCompleted ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Completion Checkbox
          Transform.scale(
            scale: 1.1,
            child: Checkbox(
              value: isSetCompleted,
              onChanged: (value) {
                setState(() {
                  _setCompleted[exercise.id]![setIndex] = value ?? false;
                  _checkExerciseCompletion(exercise.id);
                });
              },
              activeColor: AppColors.success,
              checkColor: Colors.white,
              side: BorderSide(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Set Number
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: isSetCompleted
                  ? AppColors.success.withValues(alpha: 0.2)
                  : AppColors.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSetCompleted ? AppColors.success : AppColors.primary,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                '${setIndex + 1}',
                style: AppTextStyles.h3.copyWith(
                  color: isSetCompleted ? AppColors.success : AppColors.primary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const Spacer(),

          // Reps Controls with Label Below
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Reps Controls
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: reps > 0
                        ? () {
                            setState(() {
                              _setReps[exercise.id]![setIndex] = reps - 1;
                            });
                          }
                        : null,
                    icon: const Icon(Icons.remove_circle_outline),
                    color: AppColors.primary,
                    iconSize: 28,
                  ),
                  Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '$reps',
                        style: AppTextStyles.stat.copyWith(
                          color: AppColors.primary,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _setReps[exercise.id]![setIndex] = reps + 1;
                      });
                    },
                    icon: const Icon(Icons.add_circle),
                    color: AppColors.primary,
                    iconSize: 28,
                  ),
                ],
              ),
              // Reps Label Below Controls
              const SizedBox(height: 4),
              Text(
                'Reps',
                style: AppTextStyles.bodySmall.copyWith(
                  color: isSetCompleted
                      ? AppColors.success
                      : AppColors.textTertiary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),

          // Delete Set Button
          IconButton(
            onPressed: () {
              setState(() {
                _setReps[exercise.id]!.removeAt(setIndex);
                _setCompleted[exercise.id]!.removeAt(setIndex);
              });
            },
            icon: const Icon(Icons.delete_outline),
            color: AppColors.textTertiary,
            iconSize: 20,
          ),
        ],
      ),
    );
  }

  void _showHistory(BuildContext context, Exercise exercise) {
    if (exercise.history.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No history available yet'),
          backgroundColor: AppColors.textSecondary,
        ),
      );
      return;
    }

    // Show last 5 history entries
    final recentHistory = exercise.history.take(5).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed Header
              Row(
                children: [
                  Icon(Icons.history, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    'History - ${exercise.name}',
                    style: AppTextStyles.h3,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Last ${recentHistory.length} Workouts',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),

              // Scrollable History Items
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: recentHistory.length,
                  itemBuilder: (context, index) {
                    final completion = recentHistory[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _formatDate(completion.date),
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${completion.maxSets} sets × ${completion.maxReps} reps',
                                style: AppTextStyles.h3.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.fitness_center,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Fixed Close Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    'Close',
                    style: AppTextStyles.button.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startRestTimer(BuildContext context, Exercise exercise) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => _RestTimerDialog(
        restSeconds: exercise.restSeconds,
        exerciseName: exercise.name,
      ),
    );
  }

  void _finishDay(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text(
          widget.day.isRestDay ? 'Complete Rest Day?' : 'Finish Day?',
          style: AppTextStyles.h3.copyWith(color: AppColors.success),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.day.isRestDay
                  ? 'Mark this rest day as complete and move to the next day.'
                  : 'Great work! Your progress will be saved.',
              style: AppTextStyles.bodyLarge,
            ),
            if (!widget.day.isRestDay) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: widget.day.exercises
                      .where((e) => (_exerciseCompleted[e.id] ?? false))
                      .map((exercise) {
                        final sets = _setReps[exercise.id]!;
                        final maxSets = sets.length;
                        final maxReps = sets.isNotEmpty ? sets.reduce((a, b) => a > b ? a : b) : 0;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  exercise.name,
                                  style: AppTextStyles.bodyMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '$maxSets × $maxReps',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                      .toList(),
                ),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: AppTextStyles.button.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              _saveAndFinish(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.success,
            ),
            child: Text(
              'Finish',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _saveAndFinish(BuildContext context) {
    // Handle rest days separately
    if (widget.day.isRestDay) {
      context.read<WorkoutBloc>().add(
        WorkoutEvent.markRestDayComplete(
          workoutId: widget.workout.id,
          dayId: widget.day.id,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rest day completed! 💪'),
          backgroundColor: AppColors.success,
        ),
      );

      Navigator.pop(context);
      return;
    }

    // Build exercise progress map from set reps
    final exerciseProgress = <String, Map<String, int>>{};

    for (var exercise in widget.day.exercises) {
      final sets = _setReps[exercise.id] ?? [];
      final isCompleted = _exerciseCompleted[exercise.id] ?? false;

      // Only include exercises that are marked as completed
      if (isCompleted && sets.isNotEmpty) {
        final maxSets = sets.length;
        final maxReps = sets.reduce((a, b) => a > b ? a : b);

        exerciseProgress[exercise.id] = {
          'sets': maxSets,
          'reps': maxReps,
        };
      }
    }

    // Dispatch CompleteDay event
    context.read<WorkoutBloc>().add(
      WorkoutEvent.completeDay(
        workoutId: widget.workout.id,
        dayId: widget.day.id,
        exerciseProgress: exerciseProgress,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Day completed! Great work! 💪'),
        backgroundColor: AppColors.success,
      ),
    );

    // Navigate back to workout detail
    Navigator.pop(context);
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

// Rest Timer Dialog Widget
class _RestTimerDialog extends StatefulWidget {
  final int restSeconds;
  final String exerciseName;

  const _RestTimerDialog({
    required this.restSeconds,
    required this.exerciseName,
  });

  @override
  State<_RestTimerDialog> createState() => _RestTimerDialogState();
}

class _RestTimerDialogState extends State<_RestTimerDialog> {
  late int _remainingSeconds;
  late Timer _timer;
  bool _hasPlayedWarning = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.restSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;

          // Trigger warning at 3 seconds remaining
          if (_remainingSeconds == 3 && !_hasPlayedWarning) {
            _hasPlayedWarning = true;
            _playWarning();
          }

          // Timer finished
          if (_remainingSeconds == 0) {
            _timer.cancel();
            _playFinishSound();
            // Auto-close after 2 seconds
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) {
                Navigator.of(context).pop();
              }
            });
          }
        }
      });
    });
  }

  Future<void> _playWarning() async {
    // Vibrate 3 times (short pulses)
    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator == true) {
        Vibration.vibrate(pattern: [0, 200, 100, 200, 100, 200], intensities: [0, 128, 0, 128, 0, 128]);
      }
    } catch (e) {
      // Vibration not supported on this device
    }
  }

  Future<void> _playFinishSound() async {
    // Vibrate with long pulse
    try {
      final hasVibrator = await Vibration.hasVibrator();
      if (hasVibrator == true) {
        Vibration.vibrate(duration: 500);
      }
    } catch (e) {
      // Vibration not supported on this device
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _remainingSeconds / widget.restSeconds;
    final isWarning = _remainingSeconds <= 3 && _remainingSeconds > 0;
    final isFinished = _remainingSeconds == 0;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isFinished
                ? AppColors.success
                : isWarning
                    ? AppColors.warning
                    : AppColors.primary,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: (isFinished
                      ? AppColors.success
                      : isWarning
                          ? AppColors.warning
                          : AppColors.primary)
                  .withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Rest Timer',
              style: AppTextStyles.h2.copyWith(
                color: isFinished
                    ? AppColors.success
                    : isWarning
                        ? AppColors.warning
                        : AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.exerciseName,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Circular Progress with Timer
            SizedBox(
              width: 200,
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular Progress Indicator
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 12,
                      backgroundColor: AppColors.surface,
                      valueColor: AlwaysStoppedAnimation(
                        isFinished
                            ? AppColors.success
                            : isWarning
                                ? AppColors.warning
                                : AppColors.primary,
                      ),
                    ),
                  ),
                  // Timer Text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isFinished ? 'DONE!' : '$_remainingSeconds',
                        style: AppTextStyles.stat.copyWith(
                          fontSize: isFinished ? 48 : 72,
                          color: isFinished
                              ? AppColors.success
                              : isWarning
                                  ? AppColors.warning
                                  : AppColors.primary,
                        ),
                      ),
                      if (!isFinished)
                        Text(
                          'seconds',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Close Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFinished
                      ? AppColors.success
                      : isWarning
                          ? AppColors.warning
                          : AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isFinished ? 'CLOSE' : 'SKIP',
                  style: AppTextStyles.button.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
