import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

// Column widths shared by the header and every set row, so labels sit
// exactly above their controls.
const double _checkWidth = 32;
const double _numberWidth = 32;
const double _weightWidth = 64;
const double _deleteWidth = 32;
const double _gap = 8;

/// "62.5" for fractional weights, "60" for whole ones.
String formatWeight(double weight) => weight == weight.roundToDouble()
    ? weight.toInt().toString()
    : weight.toString();

/// Column titles above the sets of one exercise: SET, REPS and, when the
/// exercise tracks weight, KG.
class SetRowHeader extends StatelessWidget {
  final bool showWeight;

  const SetRowHeader({super.key, required this.showWeight});

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.bodySmall.copyWith(
      color: AppColors.textTertiary,
      letterSpacing: 1.2,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
      child: Row(
        children: [
          const SizedBox(width: _checkWidth + _gap),
          SizedBox(
            width: _numberWidth,
            child: Text('SET', style: style, textAlign: TextAlign.center),
          ),
          const SizedBox(width: _gap),
          Expanded(
            child: Text('REPS', style: style, textAlign: TextAlign.center),
          ),
          if (showWeight) ...[
            const SizedBox(width: _gap),
            SizedBox(
              width: _weightWidth,
              child: Text('KG', style: style, textAlign: TextAlign.center),
            ),
          ],
          const SizedBox(width: _gap + _deleteWidth),
        ],
      ),
    );
  }
}

/// One set of an exercise on the active day: done checkbox, set number, reps
/// stepper, optional weight and delete. Every control is vertically centred
/// in the row.
class SetRow extends StatelessWidget {
  final int setNumber;
  final int reps;
  final double? weight;
  final bool showWeight;
  final bool completed;
  final ValueChanged<bool> onCompletedChanged;
  final ValueChanged<int> onRepsChanged;
  final VoidCallback onWeightTap;
  final VoidCallback onDelete;

  const SetRow({
    super.key,
    required this.setNumber,
    required this.reps,
    required this.weight,
    required this.showWeight,
    required this.completed,
    required this.onCompletedChanged,
    required this.onRepsChanged,
    required this.onWeightTap,
    required this.onDelete,
  });

  Color get _accent => completed ? AppColors.success : AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: completed
            ? AppColors.success.withValues(alpha: 0.15)
            : AppColors.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: completed
              ? AppColors.success
              : AppColors.primary.withValues(alpha: 0.2),
          width: completed ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: _checkWidth, child: _buildCheckbox()),
          const SizedBox(width: _gap),
          _buildSetNumber(),
          const SizedBox(width: _gap),
          // Takes the remaining width and scales down on very narrow screens
          // instead of overflowing (#16).
          Expanded(
            child: FittedBox(fit: BoxFit.scaleDown, child: _buildStepper()),
          ),
          if (showWeight) ...[const SizedBox(width: _gap), _buildWeight()],
          const SizedBox(width: _gap),
          SizedBox(
            width: _deleteWidth,
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
              color: AppColors.textTertiary,
              iconSize: 20,
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              tooltip: 'Delete set',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox() {
    return Checkbox(
      value: completed,
      onChanged: (value) => onCompletedChanged(value ?? false),
      // Drop the 48 dp tap padding so the row fits narrow phones.
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      activeColor: AppColors.success,
      checkColor: Colors.white,
      side: BorderSide(
        color: AppColors.primary.withValues(alpha: 0.5),
        width: 2,
      ),
    );
  }

  Widget _buildSetNumber() {
    return Container(
      width: _numberWidth,
      height: _numberWidth,
      decoration: BoxDecoration(
        color: _accent.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _accent, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        '$setNumber',
        style: AppTextStyles.h3.copyWith(color: _accent, fontSize: 14),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: reps > 0 ? () => onRepsChanged(reps - 1) : null,
          icon: const Icon(Icons.remove_circle_outline),
          color: AppColors.primary,
          iconSize: 28,
          visualDensity: VisualDensity.compact,
          tooltip: 'Fewer reps',
        ),
        _ValueBox(text: '$reps', color: _accent, filled: true, width: 48),
        IconButton(
          onPressed: () => onRepsChanged(reps + 1),
          icon: const Icon(Icons.add_circle),
          color: AppColors.primary,
          iconSize: 28,
          visualDensity: VisualDensity.compact,
          tooltip: 'More reps',
        ),
      ],
    );
  }

  Widget _buildWeight() {
    final value = weight;
    return InkWell(
      onTap: onWeightTap,
      borderRadius: BorderRadius.circular(8),
      child: _ValueBox(
        text: value == null ? '—' : formatWeight(value),
        color: value == null ? AppColors.textTertiary : _accent,
        filled: false,
        width: _weightWidth,
      ),
    );
  }
}

class _ValueBox extends StatelessWidget {
  final String text;
  final Color color;
  final bool filled;
  final double width;

  const _ValueBox({
    required this.text,
    required this.color,
    required this.filled,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: filled ? color.withValues(alpha: 0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 2),
      ),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: AppTextStyles.stat.copyWith(color: color, fontSize: 20),
        ),
      ),
    );
  }
}
