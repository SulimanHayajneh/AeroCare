import 'package:aerocare_app/app_theme.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final String userRole;
  const SignupScreen({super.key, required this.userRole});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedGender = "Female";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();


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
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Pink Circle
          Positioned(
            top: 170,
            left: -120,
            child: Container(
              width: 250,
              height: 200,
              decoration: const BoxDecoration(
                color: AppColors.accentPink,
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
                 Text(
                    "Create new\n${widget.userRole} Account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: AppColors.purpleText,
                        letterSpacing: 1.2,
                      ),
                  ),

                  //const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Already Registered? Log in here.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  
                  const SizedBox(height: 5),

                  /// Purple Card Container
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 18),
                    decoration: BoxDecoration(
                      color: AppColors.purpleText,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel("NAME"),
                          _buildField(_nameController, false, null),

                          const SizedBox(height: 10),

                          _buildLabel("EMAIL"),
                          _buildField(
                            _emailController,
                            false,
                            "Hello@AeroCare.com",
                          ),

                          const SizedBox(height: 10),

                          _buildLabel("PASSWORD"),
                          _buildField(_passwordController, true, "******"),

                          const SizedBox(height: 10),

                          _buildLabel("DATE OF BIRTH"),
                          _buildDateField(),

                          const SizedBox(height: 10),
                           _buildLabel('GENDER'),
                           _buildGenderDropdown(),

                          const SizedBox(height: 10,),

                          /// SIGN UP BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accentPink,
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
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white, // Added explicit white text color
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// Branding
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "AERO CARE",
                                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontFamily: 'sans serif',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                                ),
                                //SizedBox(height: 8),
                                Text(
                                  "air-quality monitor for asthma\npatients.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //const SizedBox(height: 10),
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
        fontSize: 12,
      ),
    );
  }

  Widget _buildField(
      TextEditingController controller, bool obscure, String? hint) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscure, //If true, the text turns into dots (used for passwords).
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: AppColors.fieldPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding: //It pushes the text away from the edges of the box
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
      margin: const EdgeInsets.only(top: 5),
      child: TextFormField(
        controller: _dobController,
        readOnly: true, //prevents the keyboard from popping up
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "SELECT",
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: AppColors.fieldPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select your birth date";
        }
        return null;
      },
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

  Widget _buildGenderDropdown() {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: DropdownButtonFormField<String>(
        initialValue: _selectedGender,
        dropdownColor: AppColors.primaryPurple, 
        style: const TextStyle(color: Colors.white, fontSize: 16),
        iconEnabledColor: Colors.white,
        decoration: InputDecoration(
          hintText: "SELECT",
          hintStyle: const TextStyle(color: Colors.white70),
          filled: true,
          fillColor: AppColors.fieldPurple,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        ),
        items: ["Male", "Female"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(color: Colors.white)),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedGender = newValue; // Fixed the variable name here
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required field";
          }
          return null;
        },
      ),
    );
  }
}
