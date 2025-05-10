import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// This is the OnboardingScreen widget, shown when the app starts
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App bar with a back arrow icon (no functionality yet)
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {}, // Back button doesn't do anything for now
        ),
        elevation: 0, // Removes shadow under the app bar
        backgroundColor:
            Colors.transparent, // Makes app bar background transparent
      ),

      // Body of the screen
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20), // Horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Small vertical space
              const SizedBox(height: 5),

              // Title text with two lines, second line bold
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 38,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Ready to Shape Your\n"), // First line
                    TextSpan(
                      text: "Little One’s Future?", // Second line (bold)
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // Big SVG image in the center
              Flexible(
                flex: 4, // Takes more space
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/21864181_6502439 1.svg',
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.45,
                  ),
                ),
              ),

              // Bottom section with buttons and info
              Expanded(
                flex: 2, // Takes less space
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end, // Align to bottom
                  children: [
                    // Sign up button (outlined)
                    _buildButton("Sign up", isPrimary: false, onTap: () {
                      Navigator.pushNamed(
                          context, '/sign-up'); // Go to sign-up page
                    }),

                    const SizedBox(height: 10), // Space between buttons

                    // Sign in button (filled black)
                    _buildButton("Sign in", isPrimary: true, onTap: () {
                      Navigator.pushNamed(
                          context, '/sign-in'); // Go to sign-in page
                    }),

                    const SizedBox(height: 20), // Space before footer

                    // Footer note about data privacy
                    const Text(
                      "We collect this info to personalize activities and track growth. Your data is secure and used only to enhance your experience.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF938E8A), // Light grey text
                      ),
                    ),

                    const SizedBox(height: 20), // Final space at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom button builder method
  Widget _buildButton(String text,
      {required bool isPrimary, VoidCallback? onTap}) {
    return SizedBox(
      width: 344, // Button width
      height: 58, // Button height
      child: ElevatedButton(
        onPressed: onTap, // What happens when the button is pressed
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isPrimary ? Colors.black : Colors.white, // Color based on type
          side: isPrimary
              ? null
              : const BorderSide(
                  color: Colors.black, width: 1.5), // Border if not primary
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
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
                : Colors.black, // Text color based on type
          ),
        ),
      ),
    );
  }
}
