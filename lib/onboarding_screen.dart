import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Title**
              const SizedBox(height: 5), // Reduced space
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 38, // Larger font size
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Ready to Shape Your\n"),
                    TextSpan(
                      text: "Little One’s Future?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              /// **Larger Image**
              Flexible(
                flex: 4, // Allows the image to take more space
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/21864181_6502439 1.svg',
                    width: MediaQuery.of(context).size.width *
                        0.95, // Increased width
                    height: MediaQuery.of(context).size.height *
                        0.45, // Increased height
                  ),
                ),
              ),

              /// **Bottom Section**
              Expanded(
                flex: 2, // Ensures buttons and text fit properly
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton("Sign up", isPrimary: false),
                    const SizedBox(height: 10),
                    _buildButton("Sign in", isPrimary: true),
                    const SizedBox(height: 20),

                    /// **Footer Text**
                    const Text(
                      "We collect this info to personalize activities and track growth. Your data is secure and used only to enhance your experience.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF938E8A),
                      ),
                    ),
                    const SizedBox(height: 20),

                    /// **Removed Dotted Line**
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, {required bool isPrimary}) {
    return SizedBox(
      width: 344, // Button width
      height: 58, // Button height
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? Colors.black : Colors.white,
          side: isPrimary
              ? null
              : const BorderSide(color: Colors.black, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Increased corner radius
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'InterTight',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isPrimary
                ? Colors.white
                : const Color.fromARGB(255, 2, 2, 2), // Updated "Sign up" color
          ),
        ),
      ),
    );
  }
}
