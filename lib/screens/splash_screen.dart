import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import 'auth/login_screen.dart'; // Make sure to create this

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate the timer from the React prototype
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; // Prevent async gap issues
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: AppTheme.darkBackground, // Applying the gradient
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.local_shipping, size: 80, color: Colors.white),
            SizedBox(height: 24),
            Text(
              'EXPRESS',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'DELIVERY MANAGEMENT',
              style: TextStyle(
                color: AppTheme.textMutedDark,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}