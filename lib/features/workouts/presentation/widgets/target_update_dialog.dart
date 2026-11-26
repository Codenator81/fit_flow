import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'set_row.dart';

/// Step of the weight − / + in the target dialog, the smallest common plate
/// pair.
const double weightStep = 2.5;

/// New sets × reps (and, for weighted exercises, kg) target for an exercise.
class ExerciseTarget {
  final int sets;
  final int reps;
  final double? weight;

  const ExerciseTarget(this.sets, this.reps, [this.weight]);

  /// The suggestion after a finished exercise: as many sets as were done, at
  /// the reps every one of them reached, with the heaviest weight used.
  factory ExerciseTarget.suggestFrom(
    List<int> setReps, [
    List<double?> setWeights = const [],
  ]) {
    final weights = setWeights.nonNulls;
    return ExerciseTarget(
      setReps.length,
      setReps.reduce((a, b) => a < b ? a : b),
      weights.isEmpty ? null : weights.reduce((a, b) => a > b ? a : b),
    );
  }

  bool sameAs(ExerciseTarget other) =>
      sets == other.sets && reps == other.reps && weight == other.weight;

  @override
  String toString() {
    final kg = weight;
    return kg == null
        ? '$sets × $reps'
        : '$sets × $reps · ${formatWeight(kg)} kg';
  }
}

/// Shown when a finished exercise differs from its target: offers the new
/// target with − / + for sets, reps and, when [showWeight], kg. Pops the
/// chosen target on Update and null on Keep.
class TargetUpdateDialog extends StatefulWidget {
  final String exerciseName;
  final ExerciseTarget current;
  final ExerciseTarget suggested;
  final List<int> doneReps;
  final bool showWeight;

  const TargetUpdateDialog({
    super.key,
    required this.exerciseName,
    required this.current,
    required this.suggested,
    required this.doneReps,
    this.showWeight = false,
  });

  @override
  State<TargetUpdateDialog> createState() => _TargetUpdateDialogState();
}

class _TargetUpdateDialogState extends State<TargetUpdateDialog> {
  late int _sets = widget.suggested.sets;
  late int _reps = widget.suggested.reps;
  late double _weight = widget.suggested.weight ?? widget.current.weight ?? 0;

  ExerciseTarget get _chosen =>
      ExerciseTarget(_sets, _reps, widget.showWeight ? _weight : null);

  @override
  Widget build(BuildContext context) {
    final secondary = AppTextStyles.bodyMedium.copyWith(
      color: AppColors.textSecondary,
    );
    return AlertDialog(
      backgroundColor: AppColors.background,
      title: Text('New target?', style: AppTextStyles.h3),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.exerciseName, style: AppTextStyles.bodyLarge),
          const SizedBox(height: 8),
          Text('Done: ${widget.doneReps.join(' · ')}', style: secondary),
          Text('Target: ${widget.current}', style: secondary),
          const SizedBox(height: 16),
          _Stepper(
            label: 'Sets',
            text: '$_sets',
            canDecrease: _sets > 1,
            onDecrease: () => setState(() => _sets--),
            onIncrease: () => setState(() => _sets++),
          ),
          const SizedBox(height: 8),
          _Stepper(
            label: 'Reps',
            text: '$_reps',
            canDecrease: _reps > 1,
            onDecrease: () => setState(() => _reps--),
            onIncrease: () => setState(() => _reps++),
          ),
          if (widget.showWeight) ...[
            const SizedBox(height: 8),
            _Stepper(
              label: 'Kg',
              text: formatWeight(_weight),
              canDecrease: _weight >= weightStep,
              onDecrease: () => setState(() => _weight -= weightStep),
              onIncrease: () => setState(() => _weight += weightStep),
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Keep',
            style: AppTextStyles.button.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _chosen),
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
          child: Text('Update', style: AppTextStyles.button),
        ),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  final String label;
  final String text;
  final bool canDecrease;
  final VoidCallback onDecrease;
  final VoidCallback onIncrease;

  const _Stepper({
    required this.label,
    required this.text,
    required this.canDecrease,
    required this.onDecrease,
    required this.onIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label, style: AppTextStyles.bodyLarge)),
        IconButton(
          onPressed: canDecrease ? onDecrease : null,
          icon: const Icon(Icons.remove_circle_outline),
          color: AppColors.primary,
          tooltip: 'Less $label',
        ),
        SizedBox(
          width: 56,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.stat.copyWith(
                color: AppColors.primary,
                fontSize: 20,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onIncrease,
          icon: const Icon(Icons.add_circle),
          color: AppColors.primary,
          tooltip: 'More $label',
        ),
      ],
    );
  }
}
