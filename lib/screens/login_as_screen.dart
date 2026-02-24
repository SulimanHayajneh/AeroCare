import 'package:aerocare_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aerocare_app/app_theme.dart';

class LoginAsScreen extends StatelessWidget{
  const LoginAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned( // Top Left Pink Circle
            top: 80,
            left: -125,
            child: Container(
              width: 250,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.accentPink,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned( // Bottom Right Purple Circle
            bottom: -80,
            right: -100,
            child: Container(
              width: 300,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top:100,
            right: -50,
            child: Transform.rotate(
              angle: -0.8,
              child: Image.asset(
                'assets/images/Welcome_ro.jpg',
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.face_retouching_natural,
                  size: 100,
                  color: AppColors.primaryPurple,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(flex: 4),
                  Text(
                    'AERO CARE',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontFamily: 'sans serif',
                      fontWeight: FontWeight.w900,
                      color: AppColors.purpleText,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'air-quality monitor for asthma\npatients.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.darkText,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'Login As',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontFamily: 'sans serif',
                      fontWeight: FontWeight.w900,
                      color: AppColors.purpleText,
                    ),
                  ),

                  const SizedBox(height: 30,),

                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPurple,
                      ),
                      onPressed: () { // Navigation logic for Doctor
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(userRole: 'Doctor'),
                          ),
                        );
                      },
                      child: const Text(
                        'Doctor',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox( 
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentPink,
                      ),
                      onPressed: () { // Navigation logic for patient
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(userRole: 'Patient'),
                          ),
                        );
                      },
                      child: const Text(
                        'Patient',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}