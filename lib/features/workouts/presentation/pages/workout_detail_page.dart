import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/workout.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import 'day_detail_page.dart';

class WorkoutDetailPage extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailPage({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(workout.name)),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          // Get the latest workout data if available
          final currentWorkout = state is WorkoutDetail ? state.workout : workout;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Workout info
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(currentWorkout.name, style: AppTextStyles.h2),
                      const SizedBox(height: 8),
                      Text(
                        '${currentWorkout.days.length} days',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Days section header
                Text(
                  'WORKOUT DAYS',
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),

                // Days horizontal list
                if (currentWorkout.days.isNotEmpty)
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: currentWorkout.days.length + 1,
                      itemBuilder: (context, index) {
                        // Add day button at the end
                        if (index == currentWorkout.days.length) {
                          return _buildAddDayCard(context, currentWorkout.id);
                        }

                        final day = currentWorkout.days[index];
                        return _buildDayCard(context, currentWorkout, day);
                      },
                    ),
                  )
                else
                  _buildEmptyDaysState(context, currentWorkout.id),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDayCard(BuildContext context, Workout workout, dynamic day) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (navContext) => BlocProvider.value(
              value: context.read<WorkoutBloc>(),
              child: DayDetailPage(workout: workout, day: day),
            ),
          ),
        );
      },
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
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
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day ${day.dayNumber}',
              style: AppTextStyles.h3.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              day.name,
              style: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              '${day.exercises.length} exercises',
              style: AppTextStyles.bodySmall.copyWith(
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddDayCard(BuildContext context, String workoutId) {
    return GestureDetector(
      onTap: () => _showAddDayDialog(context, workoutId),
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, size: 48, color: AppColors.primary),
            const SizedBox(height: 8),
            Text(
              'Add Day',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyDaysState(BuildContext context, String workoutId) {
    return GestureDetector(
      onTap: () => _showAddDayDialog(context, workoutId),
      child: Container(
        height: 210,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.5),
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, size: 48, color: AppColors.primary),
            const SizedBox(height: 12),
            Text(
              'Add Your First Day',
              style: AppTextStyles.h3.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDayDialog(BuildContext context, String workoutId) {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        title: Text('Add Workout Day', style: AppTextStyles.h3),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            style: AppTextStyles.bodyLarge,
            decoration: InputDecoration(
              labelText: 'Day Name',
              labelStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              hintText: 'e.g., Push, Pull, Legs',
              hintStyle: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textTertiary,
              ),
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
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a day name';
              }
              return null;
            },
            onFieldSubmitted: (_) {
              if (formKey.currentState!.validate()) {
                context.read<WorkoutBloc>().add(
                  AddDay(workoutId, controller.text.trim()),
                );
                Navigator.pop(dialogContext);
              }
            },
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
                context.read<WorkoutBloc>().add(
                  AddDay(workoutId, controller.text.trim()),
                );
                Navigator.pop(dialogContext);
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
}
