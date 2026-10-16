import 'package:fit_flow/features/auth/presentation/pages/login_page.dart';
import 'package:fit_flow/features/home/presentation/pages/home_page.dart';
import 'package:fit_flow/main.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_auth_repository.dart';
import '../fakes/fake_dependencies.dart';

void main() {
  testWidgets('signed-out user sees the login page', (tester) async {
    await registerFakeDependencies(user: null);
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });

  testWidgets('signed-in user goes straight to home', (tester) async {
    await registerFakeDependencies();
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('tapping Continue with Google signs in', (tester) async {
    final auth = await registerFakeDependencies(user: null);
    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Continue with Google'));
    await tester.pumpAndSettle();

    expect(auth.currentUser, testUser);
    expect(find.byType(HomePage), findsOneWidget);
  });
}
