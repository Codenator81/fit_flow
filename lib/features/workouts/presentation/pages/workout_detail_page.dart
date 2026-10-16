import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_day.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import 'active_day_page.dart';

class WorkoutDetailPage extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailPage({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name, style: AppTextStyles.h3),
        backgroundColor: AppColors.background,
      ),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          final currentWorkout = state is WorkoutDetail
              ? state.workout
              : workout;

          // Check if all days are completed
          final allDaysCompleted =
              currentWorkout.days.isNotEmpty &&
              currentWorkout.days.every((day) => day.isCompleted);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Workout Summary Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColors.gradientOrange,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
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
                      Text(
                        currentWorkout.name,
                        style: AppTextStyles.h2.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem(
                            '${currentWorkout.days.length}',
                            'Days',
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                          _buildStatItem(
                            '${currentWorkout.days.where((d) => d.isCompleted).length}',
                            'Completed',
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                          _buildStatItem(
                            '${currentWorkout.days.where((d) => !d.isCompleted).length}',
                            'Remaining',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Reset Workout Button (shown when all days are completed)
                if (allDaysCompleted) ...[
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: AppColors.gradientPink,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.glowPink.withValues(alpha: 0.3),
                          blurRadius: 20,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          _showResetConfirmation(context, currentWorkout),
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
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: Text(
                        'Start Workout Over',
                        style: AppTextStyles.button.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // Days Header
                Text(
                  'WORKOUT DAYS',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),

                // Days Grid
                if (currentWorkout.days.isNotEmpty)
                  ...currentWorkout.days.map(
                    (day) => _buildDayCard(context, currentWorkout, day),
                  )
                else
                  _buildEmptyState(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.stat.copyWith(color: Colors.white, fontSize: 28),
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildDayCard(BuildContext context, Workout workout, WorkoutDay day) {
    return GestureDetector(
      onTap: () => _handleDayTap(context, workout, day),
      onLongPress: () => _handleDayLongPress(context, workout, day),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: day.isRestDay
              ? AppColors.info.withValues(alpha: 0.1)
              : day.isCompleted
              ? AppColors.success.withValues(alpha: 0.1)
              : day.isActive
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: day.isRestDay
                ? AppColors.info
                : day.isCompleted
                ? AppColors.success
                : day.isActive
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.3),
            width: 2,
          ),
          boxShadow: day.isActive
              ? [
                  BoxShadow(
                    color: AppColors.glowOrange.withValues(alpha: 0.3),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            // Day Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: day.isCompleted
                    ? AppColors.success
                    : day.isActive
                    ? AppColors.primary
                    : day.isRestDay
                    ? AppColors.info
                    : AppColors.primary.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                day.isCompleted
                    ? Icons.check_circle
                    : day.isRestDay
                    ? Icons.hotel
                    : day.isActive
                    ? Icons.play_circle_filled
                    : Icons.fitness_center,
                color: day.isCompleted || day.isActive || day.isRestDay
                    ? Colors.white
                    : AppColors.primary,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),

            // Day Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Day ${day.dayNumber}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (day.isActive) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'ACTIVE',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                      if (day.isRestDay) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textTertiary.withValues(
                              alpha: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'REST',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    day.name,
                    style: AppTextStyles.h3.copyWith(
                      color: day.isCompleted
                          ? AppColors.success
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    day.isRestDay
                        ? 'Take a break and recover'
                        : '${day.exercises.length} exercises',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Status Icon
            if (day.isCompleted)
              const Icon(Icons.check_circle, color: AppColors.success, size: 32)
            else if (!day.isActive && !day.isRestDay)
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.fitness_center, size: 64, color: AppColors.textTertiary),
          const SizedBox(height: 16),
          Text(
            'No Days Yet',
            style: AppTextStyles.h3.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            'Use the Edit button to add workout days',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _handleDayTap(BuildContext context, Workout workout, WorkoutDay day) {
    if (day.isCompleted) {
      // Show completed day info
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Day already completed on ${_formatDate(day.completedDate)}',
          ),
          backgroundColor: AppColors.success,
        ),
      );
    } else if (day.isRestDay) {
      // Rest day - show info or mark complete
      _showRestDayDialog(context, workout, day);
    } else {
      // Navigate to active day page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (navContext) => BlocProvider.value(
            value: context.read<WorkoutBloc>(),
            child: ActiveDayPage(workout: workout, day: day),
          ),
        ),
      );
    }
  }

  void _showRestDayDialog(
    BuildContext context,
    Workout workout,
    WorkoutDay day,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Row(
          children: [
            Icon(Icons.hotel, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Text('Rest Day', style: AppTextStyles.h3),
          ],
        ),
        content: Text(
          'This is a rest day. Take time to recover and come back stronger!',
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
              Navigator.pop(dialogContext);
              _markRestDayComplete(context, workout, day);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.success),
            child: Text(
              'Mark Complete',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDayLongPress(
    BuildContext context,
    Workout workout,
    WorkoutDay day,
  ) {
    if (day.isCompleted) {
      // Reset completed day to active
      _setDayAsActive(context, workout, day);
    } else if (day.isRestDay) {
      _markRestDayComplete(context, workout, day);
    } else {
      _setDayAsActive(context, workout, day);
    }
  }

  void _setDayAsActive(BuildContext context, Workout workout, WorkoutDay day) {
    // Dispatch SetActiveDay event
    context.read<WorkoutBloc>().add(
      WorkoutEvent.setActiveDay(workoutId: workout.id, dayId: day.id),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          day.isCompleted
              ? '${day.name} reset and set as active!'
              : '${day.name} is now active!',
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _markRestDayComplete(
    BuildContext context,
    Workout workout,
    WorkoutDay day,
  ) {
    // Dispatch MarkRestDayComplete event
    context.read<WorkoutBloc>().add(
      WorkoutEvent.markRestDayComplete(workoutId: workout.id, dayId: day.id),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Rest day marked as complete!'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _showResetConfirmation(BuildContext context, Workout workout) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text(
          'Reset Workout?',
          style: AppTextStyles.h3.copyWith(color: AppColors.primary),
        ),
        content: Text(
          'This will mark all days as incomplete and start the workout cycle over. Your history will be preserved.',
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
              final bloc = context.read<WorkoutBloc>();
              final messenger = ScaffoldMessenger.of(context);

              Navigator.pop(dialogContext);

              // Dispatch ResetWorkout event after dialog is closed
              Future.microtask(() {
                bloc.add(WorkoutEvent.resetWorkout(workoutId));
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text('Workout reset! Ready to start over.'),
                    backgroundColor: AppColors.primary,
                  ),
                );
              });
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(
              'Reset',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Unknown';
    return '${date.day}/${date.month}/${date.year}';
  }
}
