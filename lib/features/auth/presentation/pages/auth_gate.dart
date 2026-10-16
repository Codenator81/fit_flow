import 'package:flutter/material.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import 'login_page.dart';
import '../../../home/presentation/pages/home_page.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  // Subscribe once; a new stream on every rebuild would flash the loader.
  late final Stream<AuthUser?> _authState = sl<AuthRepository>()
      .authStateChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthUser?>(
      stream: _authState,
      builder: (context, snapshot) {
        // Show loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Show login page if not authenticated
        if (!snapshot.hasData) {
          return const LoginPage();
        }

        // Show home page if authenticated
        return const HomePage();
      },
    );
  }
}
