import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../workouts/presentation/pages/workouts_page.dart';
import '../../../workouts/presentation/bloc/workout_bloc.dart';
import '../../../workouts/data/repositories/workout_repository_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FitFlow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Welcome message
            if (user != null) ...[
              Text(
                'Welcome, ${user.displayName ?? 'User'}!',
                style: AppTextStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
            ],

            // App Title
            Text('FITFLOW', style: AppTextStyles.h1),
            const SizedBox(height: 8),
            Text(
              'Your Fitness Journey Starts Here',
              style: AppTextStyles.bodyLarge,
            ),
            const SizedBox(height: 32),

            // Gradient Cards Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildGradientCard(
                  icon: Icons.flash_on,
                  gradient: AppColors.gradientYellow,
                  glowColor: AppColors.glowYellow,
                ),
                _buildGradientCard(
                  icon: Icons.local_fire_department,
                  gradient: AppColors.gradientOrange,
                  glowColor: AppColors.glowOrange,
                ),
                _buildGradientCard(
                  icon: Icons.favorite,
                  gradient: AppColors.gradientPink,
                  glowColor: AppColors.glowPink,
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Stat Card with Neon Border
            Container(
              padding: const EdgeInsets.all(32),
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
              child: Column(
                children: [
                  Text('150', style: AppTextStyles.stat),
                  const SizedBox(height: 4),
                  Text('WORKOUTS', style: AppTextStyles.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Gradient Buttons
            _buildGradientButton(
              context: context,
              text: 'MY WORKOUTS',
              gradient: AppColors.gradientOrange,
              glowColor: AppColors.glowOrange,
              onPressed: () => _navigateToWorkouts(context),
            ),
            const SizedBox(height: 16),
            _buildGradientButton(
              context: context,
              text: 'VIEW PROGRESS',
              gradient: AppColors.gradientPink,
              glowColor: AppColors.glowPink,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildGradientCard({
    required IconData icon,
    required List<Color> gradient,
    required Color glowColor,
  }) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: glowColor.withValues(alpha: 0.4),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Icon(icon, size: 48, color: Colors.white),
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

  void _navigateToWorkouts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => WorkoutBloc(
            WorkoutRepositoryImpl(
              firestore: FirebaseFirestore.instance,
              auth: FirebaseAuth.instance,
            ),
          ),
          child: const WorkoutsPage(),
        ),
      ),
    );
  }
}
