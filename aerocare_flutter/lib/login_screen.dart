import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  static const Color primaryPurple = Color(0xFF5B2E91);
  static const Color pinkColor = Color(0xFFE0449A);
  static const Color lightGreyBg = Color(0xFFF2F2F2);
  static const Color inputGrey = Color(0xFFE0E0E0);

  // Added dispose method to prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyBg,
      body: Stack(
        children: [
          /// Top Left Pink Shape
          Positioned(
            top: 120,
            left: -120,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: pinkColor,
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// Bottom Right Purple Shape
          Positioned(
            bottom: -150,
            right: -120,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: primaryPurple,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    /// Title
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: primaryPurple,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Sign in to continue.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),

                    const SizedBox(height: 60),

                    /// NAME LABEL
                    const Text(
                      "NAME",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// NAME FIELD
                    _buildInputField(
                      controller: _nameController,
                      hint: "",
                      obscure: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter your name";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    /// PASSWORD LABEL
                    const Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 1.2,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// PASSWORD FIELD
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

                    /// LOGIN BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pinkColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle login
                          }
                        },
                        child: const Text(
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // Added explicit white text color
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// SIGNUP TEXT
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(), // Added const here
                            ),
                          );
                        },
                        child: const Text(
                          "New User, Signup !",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),

                    /// BRANDING
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            "AERO CARE",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: primaryPurple,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "air-quality monitor for asthma\npatients.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: inputGrey,
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