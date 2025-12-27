import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/workout_bloc.dart';
import '../bloc/workout_event.dart';
import '../bloc/workout_state.dart';
import '../widgets/add_workout_bottom_sheet.dart';
import 'workout_detail_page.dart';

class WorkoutsPage extends StatelessWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Workouts')),
      body: BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutInitial) {
            context.read<WorkoutBloc>().add(const LoadWorkouts());
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorkoutLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WorkoutLoaded) {
            if (state.workouts.isEmpty) {
              return _buildEmptyState(context);
            }
            return _buildWorkoutsList(context, state.workouts);
          } else if (state is WorkoutError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: AppColors.error),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: AppTextStyles.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<WorkoutBloc>().add(const LoadWorkouts());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          // Default case (WorkoutDetail state)
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Big square with +
            GestureDetector(
              onTap: () => _showAddWorkoutSheet(context),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.gradientOrange,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.glowOrange.withValues(alpha: 0.5),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(Icons.add, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Create Your First Workout',
              style: AppTextStyles.h2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Tap the + button to get started',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutsList(BuildContext context, List workouts) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: workouts.length + 1,
      itemBuilder: (context, index) {
        // Add workout button at the end
        if (index == workouts.length) {
          return _buildAddWorkoutCard(context);
        }

        final workout = workouts[index];
        return _buildWorkoutCard(context, workout);
      },
    );
  }

  Widget _buildWorkoutCard(BuildContext context, dynamic workout) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (navContext) => BlocProvider.value(
              value: context.read<WorkoutBloc>(),
              child: WorkoutDetailPage(workout: workout),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(workout.name, style: AppTextStyles.h3),
            const SizedBox(height: 8),
            Text(
              '${workout.days.length} days',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddWorkoutCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAddWorkoutSheet(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_circle_outline, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Text(
              'Add New Workout',
              style: AppTextStyles.h3.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddWorkoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => BlocProvider.value(
        value: context.read<WorkoutBloc>(),
        child: const AddWorkoutBottomSheet(),
      ),
    );
  }
}
