import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_day.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';

class EditWorkoutPage extends StatelessWidget {
  final Workout workout;

  const EditWorkoutPage({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${workout.name}', style: AppTextStyles.h3),
        backgroundColor: AppColors.background,
      ),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutDetail) {
            final currentWorkout = state.workout;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Workout Name
                  Text(
                    currentWorkout.name,
                    style: AppTextStyles.h2.copyWith(color: AppColors.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${currentWorkout.days.length} Days',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Days List
                  ...currentWorkout.days.map((day) => _buildDayCard(context, currentWorkout, day)),

                  const SizedBox(height: 16),

                  // Add Day Button
                  SizedBox(
                    width: double.infinity,
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
                        onPressed: () => _showAddDayDialog(context, currentWorkout),
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
                        ),
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: Text(
                          'Add Day',
                          style: AppTextStyles.button.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDayCard(BuildContext context, Workout workout, WorkoutDay day) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: day.isRestDay
            ? AppColors.info.withValues(alpha: 0.1)
            : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: day.isRestDay
              ? AppColors.info
              : AppColors.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day Header
          Row(
            children: [
              // Rest Day Icon
              if (day.isRestDay) ...[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.info,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.hotel,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          day.name,
                          style: AppTextStyles.h3,
                        ),
                        if (day.isRestDay) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textTertiary.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'REST DAY',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      day.isRestDay
                          ? 'Take a break'
                          : '${day.exercises.length} exercises',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // Delete Icon Button
              IconButton(
                onPressed: () => _showDeleteDayConfirmation(context, workout, day),
                icon: const Icon(Icons.delete_outline),
                color: AppColors.error,
                tooltip: 'Delete Day',
              ),
            ],
          ),

          // Exercises List (if not rest day)
          if (!day.isRestDay && day.exercises.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Divider(color: AppColors.textTertiary),
            const SizedBox(height: 12),
            ...day.exercises.map((exercise) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.fitness_center,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          exercise.name,
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                      Text(
                        '${exercise.sets}×${exercise.reps}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          // Add Exercise Button (if not rest day)
          if (!day.isRestDay) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showAddExerciseDialog(context, workout, day),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary, width: 1.5),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.add, size: 20),
                label: Text(
                  'Add Exercise',
                  style: AppTextStyles.button.copyWith(
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showAddDayDialog(BuildContext context, Workout workout) {
    final nameController = TextEditingController();
    bool isRestDay = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (builderContext, setState) => AlertDialog(
          backgroundColor: AppColors.background,
          title: Text('Add Day', style: AppTextStyles.h3),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                style: AppTextStyles.bodyLarge,
                decoration: InputDecoration(
                  labelText: 'Day Name',
                  hintText: 'e.g., Push Day, Pull Day',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                value: isRestDay,
                onChanged: (value) {
                  setState(() {
                    isRestDay = value ?? false;
                  });
                },
                title: Text(
                  'Rest Day',
                  style: AppTextStyles.bodyMedium,
                ),
                subtitle: Text(
                  'Mark this as a recovery day',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                activeColor: AppColors.primary,
                contentPadding: EdgeInsets.zero,
              ),
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
                if (nameController.text.trim().isNotEmpty) {
                  final workoutId = workout.id;
                  final dayName = nameController.text.trim();
                  final isRest = isRestDay;
                  final bloc = context.read<WorkoutBloc>();

                  Navigator.pop(dialogContext);

                  // Dispatch AddDay event after dialog is closed
                  Future.microtask(() {
                    bloc.add(
                      WorkoutEvent.addDay(
                        workoutId: workoutId,
                        dayName: dayName,
                        isRestDay: isRest,
                      ),
                    );
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Text(
                'Add',
                style: AppTextStyles.button.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context, Workout workout, WorkoutDay day) {
    final nameController = TextEditingController();
    final setsController = TextEditingController();
    final repsController = TextEditingController();
    final restSecondsController = TextEditingController(text: '60');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text('Add Exercise', style: AppTextStyles.h3),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                autofocus: true,
                style: AppTextStyles.bodyLarge,
                decoration: InputDecoration(
                  labelText: 'Exercise Name',
                  hintText: 'e.g., Bench Press',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: setsController,
                      keyboardType: TextInputType.number,
                      style: AppTextStyles.bodyLarge,
                      decoration: InputDecoration(
                        labelText: 'Sets',
                        filled: true,
                        fillColor: AppColors.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        if (int.tryParse(value) == null) return 'Invalid';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: repsController,
                      keyboardType: TextInputType.number,
                      style: AppTextStyles.bodyLarge,
                      decoration: InputDecoration(
                        labelText: 'Reps',
                        filled: true,
                        fillColor: AppColors.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Required';
                        if (int.tryParse(value) == null) return 'Invalid';
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: restSecondsController,
                keyboardType: TextInputType.number,
                style: AppTextStyles.bodyLarge,
                decoration: InputDecoration(
                  labelText: 'Rest Time (seconds)',
                  hintText: 'Default: 60 seconds',
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.timer, color: AppColors.primary),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  final seconds = int.tryParse(value);
                  if (seconds == null) return 'Invalid';
                  if (seconds <= 0) return 'Must be > 0';
                  return null;
                },
              ),
            ],
          ),
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
              if (formKey.currentState!.validate()) {
                final workoutId = workout.id;
                final dayId = day.id;
                final exerciseName = nameController.text.trim();
                final sets = int.parse(setsController.text);
                final reps = int.parse(repsController.text);
                final restSeconds = int.parse(restSecondsController.text);
                final bloc = context.read<WorkoutBloc>();

                Navigator.pop(dialogContext);

                // Dispatch AddExercise event after dialog is closed
                Future.microtask(() {
                  bloc.add(
                    WorkoutEvent.addExercise(
                      workoutId: workoutId,
                      dayId: dayId,
                      exerciseName: exerciseName,
                      sets: sets,
                      reps: reps,
                      restSeconds: restSeconds,
                    ),
                  );
                });
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(
              'Add',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDayConfirmation(BuildContext context, Workout workout, WorkoutDay day) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: AppColors.error),
            const SizedBox(width: 8),
            Text('Delete Day?', style: AppTextStyles.h3),
          ],
        ),
        content: Text(
          'Are you sure you want to delete "${day.name}"? This action cannot be undone.',
          style: AppTextStyles.bodyLarge,
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
              final workoutId = workout.id;
              final dayId = day.id;
              final bloc = context.read<WorkoutBloc>();

              Navigator.pop(dialogContext);

              // Dispatch DeleteDay event after dialog is closed
              Future.microtask(() {
                bloc.add(
                  WorkoutEvent.deleteDay(
                    workoutId: workoutId,
                    dayId: dayId,
                  ),
                );
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: Text(
              'Delete',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
