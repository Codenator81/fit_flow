import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const primary = Color(0xFFFF6B35); // Vibrant Orange
  static const primaryDark = Color(0xFFE55A2B); // Darker Orange
  static const primaryLight = Color(0xFFFF8C61); // Lighter Orange

  // Background Colors
  static const background = Color(0xFF0D0D0D); // Deep Black
  static const backgroundLight = Color(0xFF1A1A1A); // Charcoal
  static const surface = Color(0xFF262626); // Card/Surface

  // Text Colors
  static const textPrimary = Color(0xFFFFFFFF); // Pure White
  static const textSecondary = Color(0xB3FFFFFF); // White 70% opacity
  static const textTertiary = Color(0x80FFFFFF); // White 50% opacity

  // Functional Colors
  static const success = Color(0xFF4CAF50); // Green
  static const error = Color(0xFFE53935); // Red
  static const warning = Color(0xFFFFA726); // Amber
  static const info = Color(0xFF29B6F6); // Blue

  // Accent Colors
  static const accent1 = Color(0xFFFF6B35); // Orange (primary)
  static const accent2 = Color(0xFF00D9FF); // Cyan
  static const accentYellow = Color(0xFFFFD700); // Gold
  static const accentPink = Color(0xFFFF006E); // Hot Pink
  static const accentPurple = Color(0xFFBB86FC); // Purple

  // Gradient Colors
  static const gradientYellowStart = Color(0xFFFFC107); // Amber
  static const gradientYellowEnd = Color(0xFFFFEB3B); // Yellow

  static const gradientOrangeStart = Color(0xFFFF6B35); // Orange
  static const gradientOrangeEnd = Color(0xFFFF006E); // Hot Pink

  static const gradientPinkStart = Color(0xFFFF006E); // Hot Pink
  static const gradientPinkEnd = Color(0xFFBB86FC); // Purple

  static const gradientDarkStart = Color(0xFF0D0D0D); // Deep Black
  static const gradientDarkEnd = Color(0xFF1A1A1A); // Charcoal

  // Gradient Presets (as List<Color> for easy use)
  static const gradientYellow = [gradientYellowStart, gradientYellowEnd];
  static const gradientOrange = [gradientOrangeStart, gradientOrangeEnd];
  static const gradientPink = [gradientPinkStart, gradientPinkEnd];
  static const gradientDark = [gradientDarkStart, gradientDarkEnd];

  // Neon Glow Colors (for borders and shadows)
  static const glowYellow = Color(0xFFFFC107);
  static const glowOrange = Color(0xFFFF6B35);
  static const glowPink = Color(0xFFFF006E);
  static const glowPurple = Color(0xFFBB86FC);

  // Helper method to create gradient
  static LinearGradient createGradient(List<Color> colors, {
    AlignmentGeometry begin = Alignment.topLeft,
    AlignmentGeometry end = Alignment.bottomRight,
  }) {
    return LinearGradient(
      colors: colors,
      begin: begin,
      end: end,
    );
  }

  // Predefined gradients for cards
  static LinearGradient get cardGradientYellow => createGradient(gradientYellow);
  static LinearGradient get cardGradientOrange => createGradient(gradientOrange);
  static LinearGradient get cardGradientPink => createGradient(gradientPink);
}
