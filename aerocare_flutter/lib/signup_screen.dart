import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  static const Color primaryPurple = Color(0xFF5B2E91);
  static const Color pinkColor = Color(0xFFE0449A);
  static const Color lightGreyBg = Color(0xFFF2F2F2);
  static const Color fieldPurple = Color(0xFF8E7BB5);

  // Added dispose method to prevent memory leaks
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyBg,
      body: Stack(
        children: [
          /// Pink Circle
          Positioned(
            top: 200,
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

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 50),

                  /// Title
                  const Text(
                    "Create new\nAccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: primaryPurple,
                    ),
                  ),

                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Already Registered? Log in here.",
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// Purple Card Container
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 30),
                    decoration: BoxDecoration(
                      color: primaryPurple,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("NAME"),
                          _buildField(_nameController, false, null),

                          const SizedBox(height: 25),

                          _buildLabel("EMAIL"),
                          _buildField(
                            _emailController,
                            false,
                            "HELLO@REALLYGREATSITE.COM",
                          ),

                          const SizedBox(height: 25),

                          _buildLabel("PASSWORD"),
                          _buildField(_passwordController, true, "******"),

                          const SizedBox(height: 25),

                          _buildLabel("DATE OF BIRTH"),
                          _buildDateField(),

                          const SizedBox(height: 35),

                          /// SIGN UP BUTTON
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
                                  // Handle signup
                                }
                              },
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: 16,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white, // Added explicit white text color
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),

                          /// Branding
                          const Center(
                            child: Column(
                              children: [
                                Text(
                                  "AERO CARE",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "air-quality monitor for asthma\npatients.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 2,
        fontSize: 14,
      ),
    );
  }

  Widget _buildField(
      TextEditingController controller, bool obscure, String? hint) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: fieldPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required field";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: TextFormField(
        controller: _dobController,
        readOnly: true,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "SELECT",
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: fieldPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1950),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            _dobController.text =
                "${picked.day}/${picked.month}/${picked.year}";
          }
        },
      ),
    );
  }
}