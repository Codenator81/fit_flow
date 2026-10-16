import 'package:fit_flow/core/theme/app_theme.dart';
import 'package:fit_flow/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helpers.dart';

void main() {
  testWidgets('LoginPage matches golden', (tester) async {
    await expectScreenGolden(
      tester,
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const LoginPage(),
      ),
      'login_page',
    );
  });
}
