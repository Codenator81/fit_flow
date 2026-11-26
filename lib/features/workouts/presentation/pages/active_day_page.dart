import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_day.dart';
import '../../domain/entities/exercise.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../widgets/set_row.dart';
import '../widgets/target_update_dialog.dart';

class ActiveDayPage extends StatefulWidget {
  final Workout workout;
  final WorkoutDay day;

  const ActiveDayPage({super.key, required this.workout, required this.day});

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

  // Weight (kg) of each set, only for exercises that track weight
  final Map<String, List<double?>> _setWeights = {};

  // New sets × reps targets accepted after finishing an exercise
  final Map<String, ExerciseTarget> _newTargets = {};

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
      _setCompleted[exercise.id] = List.generate(exercise.sets, (_) => false);
      // Start from the target weight, else the heaviest of the last session.
      final lastWeight =
          exercise.targetWeight ??
          (exercise.history.isEmpty ? null : exercise.history.first.maxWeight);
      _setWeights[exercise.id] = List.generate(
        exercise.sets,
        (_) => lastWeight,
      );
      _exerciseCompleted[exercise.id] = false;
    }
  }

  void _checkExerciseCompletion(Exercise exercise) {
    // Auto-complete exercise if all sets are complete
    final sets = _setCompleted[exercise.id] ?? const <bool>[];
    final wasCompleted = _exerciseCompleted[exercise.id] ?? false;
    if (wasCompleted || sets.isEmpty || !sets.every((done) => done)) return;
    setState(() => _exerciseCompleted[exercise.id] = true);
    _offerTargetUpdate(exercise);
  }

  /// After an exercise is finished with other sets or reps than its target,
  /// offers to change the target for the next session.
  Future<void> _offerTargetUpdate(Exercise exercise) async {
    final reps = _setReps[exercise.id] ?? const <int>[];
    if (reps.isEmpty) return;
    final weighted = exercise.tracksWeight;
    final current = ExerciseTarget(
      exercise.sets,
      exercise.reps,
      weighted ? exercise.targetWeight : null,
    );
    final done = ExerciseTarget.suggestFrom(
      reps,
      weighted ? _setWeights[exercise.id]! : const [],
    );
    final suggested = ExerciseTarget(
      done.sets,
      done.reps,
      done.weight ?? current.weight,
    );
    if (suggested.sameAs(current)) return;
    final chosen = await showDialog<ExerciseTarget>(
      context: context,
      builder: (_) => TargetUpdateDialog(
        exerciseName: exercise.name,
        current: current,
        suggested: suggested,
        doneReps: List.of(reps),
        showWeight: weighted,
      ),
    );
    if (!mounted) return;
    setState(() {
      if (chosen == null || chosen.sameAs(current)) {
        _newTargets.remove(exercise.id);
      } else {
        _newTargets[exercise.id] = chosen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Count manually completed exercises
    final completedExercises = _exerciseCompleted.values
        .where((completed) => completed)
        .length;
    final totalExercises = widget.day.exercises.length;
    final progress = totalExercises > 0
        ? completedExercises / totalExercises
        : 0.0;

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
                onPressed:
                    (completedExercises == totalExercises &&
                            totalExercises > 0) ||
                        widget.day.isRestDay
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
                  color:
                      ((completedExercises == totalExercises &&
                              totalExercises > 0) ||
                          widget.day.isRestDay)
                      ? Colors.white
                      : AppColors.textTertiary,
                ),
                label: Text(
                  'Finish Day',
                  style: AppTextStyles.button.copyWith(
                    color:
                        ((completedExercises == totalExercises &&
                                totalExercises > 0) ||
                            widget.day.isRestDay)
                        ? Colors.white
                        : AppColors.textTertiary,
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
            // Exercise Header with Completion Switch
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exercise.name,
                        style: AppTextStyles.h3.copyWith(
                          color: isCompleted
                              ? AppColors.success
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Target: ${ExerciseTarget(exercise.sets, exercise.reps, exercise.targetWeight)}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      if (_newTargets[exercise.id] case final next?)
                        Text(
                          'Next time: $next',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                    ],
                  ),
                ),
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
                      if (value) _offerTargetUpdate(exercise);
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
            SetRowHeader(showWeight: exercise.tracksWeight),
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
                    // A new set starts from the last set's reps and weight.
                    final reps = _setReps[exercise.id]!;
                    final weights = _setWeights[exercise.id]!;
                    reps.add(reps.isEmpty ? exercise.reps : reps.last);
                    _setCompleted[exercise.id]!.add(false);
                    weights.add(weights.isEmpty ? null : weights.last);
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
    return SetRow(
      setNumber: setIndex + 1,
      reps: _setReps[exercise.id]![setIndex],
      weight: _setWeights[exercise.id]![setIndex],
      showWeight: exercise.tracksWeight,
      completed: _setCompleted[exercise.id]![setIndex],
      onCompletedChanged: (value) {
        setState(() => _setCompleted[exercise.id]![setIndex] = value);
        _checkExerciseCompletion(exercise);
      },
      onRepsChanged: (reps) {
        setState(() => _setReps[exercise.id]![setIndex] = reps);
      },
      onWeightTap: () => _editWeight(exercise, setIndex),
      onDelete: () {
        setState(() {
          _setReps[exercise.id]!.removeAt(setIndex);
          _setCompleted[exercise.id]!.removeAt(setIndex);
          _setWeights[exercise.id]!.removeAt(setIndex);
        });
      },
    );
  }

  Future<void> _editWeight(Exercise exercise, int setIndex) async {
    final weights = _setWeights[exercise.id]!;
    final result = await showDialog<_WeightInput>(
      context: context,
      builder: (_) =>
          _WeightDialog(setNumber: setIndex + 1, initial: weights[setIndex]),
    );
    if (result == null || !mounted) return;
    setState(() => weights[setIndex] = result.weight);
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
                  Text('History - ${exercise.name}', style: AppTextStyles.h3),
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
                                _formatCompletion(completion),
                                style: AppTextStyles.h3.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.fitness_center, color: AppColors.primary),
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
                        final maxReps = sets.isNotEmpty
                            ? sets.reduce((a, b) => a > b ? a : b)
                            : 0;

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
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
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
    final exerciseProgress = <String, ExerciseResult>{};

    for (var exercise in widget.day.exercises) {
      final sets = _setReps[exercise.id] ?? [];
      final isCompleted = _exerciseCompleted[exercise.id] ?? false;

      // Only include exercises that are marked as completed
      if (isCompleted && sets.isNotEmpty) {
        final maxSets = sets.length;
        final maxReps = sets.reduce((a, b) => a > b ? a : b);

        final weights = (_setWeights[exercise.id] ?? []).nonNulls;
        final target = _newTargets[exercise.id];
        exerciseProgress[exercise.id] = ExerciseResult(
          sets: maxSets,
          reps: maxReps,
          targetSets: target?.sets,
          targetReps: target?.reps,
          targetWeight: target?.weight,
          maxWeight: exercise.tracksWeight && weights.isNotEmpty
              ? weights.reduce((a, b) => a > b ? a : b)
              : null,
        );
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

  String _formatCompletion(ExerciseCompletion completion) {
    final base = '${completion.maxSets} sets × ${completion.maxReps} reps';
    final weight = completion.maxWeight;
    return weight == null ? base : '$base · ${formatWeight(weight)} kg';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

/// Result of the weight dialog; a null [weight] clears the set's weight.
class _WeightInput {
  final double? weight;

  const _WeightInput(this.weight);
}

class _WeightDialog extends StatefulWidget {
  final int setNumber;
  final double? initial;

  const _WeightDialog({required this.setNumber, required this.initial});

  @override
  State<_WeightDialog> createState() => _WeightDialogState();
}

class _WeightDialogState extends State<_WeightDialog> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    _controller = TextEditingController(
      text: initial == null ? '' : formatWeight(initial),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static double? _parse(String text) =>
      double.tryParse(text.trim().replaceAll(',', '.'));

  String? _validate(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    final weight = _parse(value);
    if (weight == null || weight < 0 || weight > 1000) return 'Invalid';
    return null;
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final text = _controller.text.trim();
    Navigator.pop(context, _WeightInput(text.isEmpty ? null : _parse(text)));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Text('Set ${widget.setNumber} weight', style: AppTextStyles.h3),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: AppTextStyles.bodyLarge,
          decoration: const InputDecoration(
            labelText: 'Weight',
            suffixText: 'kg',
            filled: true,
            fillColor: AppColors.surface,
          ),
          validator: _validate,
          onFieldSubmitted: (_) => _save(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, const _WeightInput(null)),
          child: Text(
            'Clear',
            style: AppTextStyles.button.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text('Save', style: AppTextStyles.button),
        ),
      ],
    );
  }
}
