import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// "Track weight" option in the add-exercise dialogs. When on, the active day
/// shows a weight field next to the reps of every set.
class TrackWeightCheckbox extends StatelessWidget {
  final ValueNotifier<bool> value;

  const TrackWeightCheckbox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: value,
      builder: (context, checked, _) => CheckboxListTile(
        value: checked,
        onChanged: (newValue) => value.value = newValue ?? false,
        title: Text('Track weight', style: AppTextStyles.bodyLarge),
        subtitle: Text(
          'Log the weight (kg) of every set',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.primary,
        checkColor: Colors.white,
      ),
    );
  }
}
