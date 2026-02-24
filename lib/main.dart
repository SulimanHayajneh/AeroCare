import 'package:aerocare_app/screens/login_as_screen.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
void main() {
  runApp(const AeroCareApp());
}

class AeroCareApp extends StatelessWidget {
  const AeroCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AeroCare',
      theme: AppTheme.light,
      home: const LoginAsScreen(),
    );
  }
}
