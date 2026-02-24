import 'package:flutter/material.dart';
import 'package:aerocare_app/app_theme.dart';

class DeviceConnectionScreen extends StatefulWidget {
  const DeviceConnectionScreen({super.key});

  @override
  State<DeviceConnectionScreen> createState() => _DeviceConnectionScreenState();
}

class _DeviceConnectionScreenState extends State<DeviceConnectionScreen> {
  
  bool _isConnecting = false;

  
  Future<void> _connectDevice() async {
    // Update the UI to show loading
    setState(() {
      _isConnecting = true;
    });

    // Simulate a delay for Bluetooth/Wi-Fi connection (e.g., 3 seconds)
    await Future.delayed(const Duration(seconds: 3));

    // Ensure the widget is still mounted before updating UI or navigating
    if (!mounted) return;

    // Update the UI back to idle (or navigate away)
    setState(() {
      _isConnecting = false;
    });

    // Show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Device connected successfully!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );

    // TODO: Navigate to the Readings screen here
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ReadingsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // --- Background Shapes ---
          Positioned(
            bottom: -100,
            right: -80,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF8C64D8), // Light Purple
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: AppColors.accentPink, // Pink
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -100,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFF4A2B70), // Dark Purple
                shape: BoxShape.circle,
              ),
            ),
          ),

          // --- Foreground Content ---
          SafeArea(
            child: Column(
              children: [
                // Top Right Text & Underline
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 30.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Device\nConnection',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 2,
                          width: 100,
                          color: AppColors.fieldPurple,
                        ),
                      ],
                    ),
                  ),
                ),
                
                const Spacer(),

                // Mascot & Logo Image
                Image.asset(
                  'assets/images/aerocare_mascot.png', 
                  height: 250,
                  fit: BoxFit.contain,
                ),
                
                const SizedBox(height: 40),

                // Connect Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      // 3. Disable button if already connecting
                      onPressed: _isConnecting ? null : _connectDevice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A2B70),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFF4A2B70).withValues(alpha: .7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      // 4. Swap text for a loading indicator based on state
                      child: _isConnecting
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text(
                              'CONNECT YOUR DEVICE',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.2,
                              ),
                            ),
                    ),
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}