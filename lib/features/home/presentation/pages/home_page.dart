import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../workouts/presentation/pages/workout_detail_page.dart';
import '../../../workouts/presentation/bloc/workout_bloc.dart';
import '../../../workouts/presentation/bloc/workout_event.dart';
import '../../../workouts/presentation/bloc/workout_state.dart';
import '../../../workouts/data/repositories/workout_repository_impl.dart';
import '../../../workouts/presentation/widgets/add_workout_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkoutBloc(
        WorkoutRepositoryImpl(
          firestore: FirebaseFirestore.instance,
          auth: FirebaseAuth.instance,
        ),
      )..add(const WorkoutEvent.loadWorkouts()),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('FitFlow'),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/settings');
                  // Reload workouts when returning from settings
                  if (context.mounted) {
                    context.read<WorkoutBloc>().add(const WorkoutEvent.loadWorkouts());
                  }
                },
              ),
            ],
          ),
          body: BlocBuilder<WorkoutBloc, WorkoutState>(
            builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  // App Title
                  Text('FITFLOW', style: AppTextStyles.h1),
                  const SizedBox(height: 8),
                  Text(
                    'Your Fitness Journey Starts Here',
                    style: AppTextStyles.bodyLarge,
                  ),
                  const SizedBox(height: 32),

                  // Current Workout Status Card
                  _buildWorkoutStatusCard(context, state),
                  const SizedBox(height: 32),

                  // Quick Action Button
                  if (state is WorkoutLoaded && state.workouts.isNotEmpty) ...[
                    _buildGradientButton(
                      context: context,
                      text: 'START WORKOUT',
                      gradient: AppColors.gradientOrange,
                      glowColor: AppColors.glowOrange,
                      onPressed: () => _navigateToCurrentWorkout(context, state),
                    ),
                  ],
                ],
              ),
                ),
            );
          },
        ),
      ),
        ),
    );
  }

  Widget _buildWorkoutStatusCard(BuildContext context, WorkoutState state) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 2,
          color: AppColors.glowOrange.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.glowOrange.withValues(alpha: 0.3),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: state.when(
        initial: () => _buildEmptyWorkoutState(context),
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ),
        loaded: (workouts) {
          if (workouts.isEmpty) {
            return _buildEmptyWorkoutState(context);
          }
          // Use first workout as current workout
          final currentWorkout = workouts.first;
          return Column(
            children: [
              Icon(
                Icons.fitness_center,
                size: 48,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'CURRENT WORKOUT',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textTertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                currentWorkout.name,
                style: AppTextStyles.h2.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '${currentWorkout.days.length} Days',
                style: AppTextStyles.bodyLarge,
              ),
            ],
          );
        },
        detail: (_) => _buildEmptyWorkoutState(context),
        error: (message) => Column(
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              'Error loading workouts',
              style: AppTextStyles.h3.copyWith(color: AppColors.error),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: AppTextStyles.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyWorkoutState(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.fitness_center,
          size: 64,
          color: AppColors.textTertiary,
        ),
        const SizedBox(height: 16),
        Text(
          'No Workout Selected',
          style: AppTextStyles.h3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Create your first workout to get started',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textTertiary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Container(
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (bottomSheetContext) => BlocProvider.value(
                  value: context.read<WorkoutBloc>(),
                  child: const AddWorkoutBottomSheet(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add New Workout',
              style: AppTextStyles.button.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton({
    required BuildContext context,
    required String text,
    required List<Color> gradient,
    required Color glowColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: 0.4),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.button.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  void _navigateToCurrentWorkout(BuildContext context, WorkoutLoaded state) async {
    if (state.workouts.isNotEmpty) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (navContext) => BlocProvider.value(
            value: context.read<WorkoutBloc>(),
            child: WorkoutDetailPage(workout: state.workouts.first),
          ),
        ),
      );
      // Reload workouts when returning from workout detail
      if (context.mounted) {
        context.read<WorkoutBloc>().add(const WorkoutEvent.loadWorkouts());
      }
    }
  }

}
