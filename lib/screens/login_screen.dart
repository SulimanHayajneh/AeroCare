import 'package:aerocare_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:aerocare_app/app_theme.dart';

class LoginScreen extends StatefulWidget {
  final String userRole;

  const LoginScreen({super.key, required this.userRole});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  // Standard Flutter naming is camelCase: _isLoading
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Fixed: Set to true so the keyboard doesn't cover your input fields
      resizeToAvoidBottomInset: true, 
      body: Stack(
        children: [
          // --- Background Decorative Shapes ---
          Positioned(
            top: 150,
            left: -130,
            child: Container(
              width: 280,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.accentPink,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- Main Content Layer ---
          SafeArea(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    // Added padding here for better scroll behavior
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        Text(
                          'Login',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontFamily: 'sans serif',
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                color: AppColors.purpleText,
                                letterSpacing: 1.2,
                              ),
                        ),
                        const Text(
                          'Clear air, clear mind. Welcome back!',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 20),

                        // --- THE WHITE CARD ---
                        Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "NAME",
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 1.2,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildInputField(
                                  controller: _nameController,
                                  hint: "Enter your name",
                                  obscure: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter your name";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "PASSWORD",
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 1.2,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                _buildInputField(
                                  controller: _passwordController,
                                  hint: "******",
                                  obscure: true,
                                  validator: (value) {
                                    if (value == null || value.length < 6) {
                                      return "Password must be at least 6 characters";
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 40),
                                
                                // Login Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.accentPink,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() => _isLoading = true);
                                        // Add actual login logic here
                                      }
                                    },
                                    child: const Text(
                                      'LOG IN',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Center(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignupScreen(
                                            userRole: widget.userRole,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'New User, Signup !',
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                            color: AppColors.darkText,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'AERO CARE',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.purpleText,
                              ),
                        ),
                        const Text(
                          'air-quality monitor for asthma\npatients.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
          ),

          Positioned(
            bottom: 10,
            right: -110,
            child: Container(
              width: 200,
              height: 180,
              decoration: const BoxDecoration(
                color: AppColors.primaryPurple,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Moved this helper method INSIDE the State class so it can access context/theme easily
  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
    required bool obscure,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        // If AppColors.lightGray is undefined, use Color(0xFFD9D9D9)
        fillColor: const Color(0xFFD9D9D9), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );
  }
}