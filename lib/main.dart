import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Enable Firestore offline persistence
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFlow',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitFlow'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
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
              text: 'START WORKOUT',
              gradient: AppColors.gradientOrange,
              glowColor: AppColors.glowOrange,
            ),
            const SizedBox(height: 16),
            _buildGradientButton(
              text: 'VIEW PROGRESS',
              gradient: AppColors.gradientPink,
              glowColor: AppColors.glowPink,
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
      child: Icon(
        icon,
        size: 48,
        color: Colors.white,
      ),
    );
  }

  static Widget _buildGradientButton({
    required String text,
    required List<Color> gradient,
    required Color glowColor,
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
        onPressed: () {},
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
}

