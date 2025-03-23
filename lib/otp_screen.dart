import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart'; // For controlling text input

// This screen is used for entering an OTP (One-Time Password)
class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController =
      TextEditingController(); // Controls the OTP input
  String enteredOtp = ''; // Stores the current entered OTP

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White screen background

      // AppBar with a back arrow
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // No shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>
              Navigator.pop(context), // Go back to the previous screen
        ),
      ),

      // Body content
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20), // Padding on both sides
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title: "Enter Code"
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "Enter Code",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 8), // Small space

            // Subtitle explaining where the OTP was sent
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "We’ve sent an email with an OTP to email:",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),

            // Hardcoded email address (you can replace with dynamic one)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: const Text(
                "youremail@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111111),
                ),
              ),
            ),

            const SizedBox(height: 20), // Space before OTP boxes

            // OTP input field using 5 boxes
            Center(
              child: SizedBox(
                width: (62 * 5) + (8 * 4), // Width to fit 5 boxes with spacing
                child: PinCodeTextField(
                  appContext: context,
                  length: 5,
                  obscureText: false, // Show digits
                  animationType: AnimationType.fade,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Space between boxes

                  // Box style
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(13),
                    fieldHeight: 76,
                    fieldWidth: 62,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveColor:
                        Color(0xFFD1D1D1), // Grey border when inactive
                    selectedColor: Colors.black, // Border when selected
                    activeColor: Colors.black, // Border when active
                  ),

                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true, // Fill boxes with color
                  controller: otpController, // Controls entered OTP
                  keyboardType: TextInputType.number, // Number keyboard

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only allow digits (0–9)

                  // When OTP value changes
                  onChanged: (value) {
                    setState(() {
                      enteredOtp = value; // Save the entered OTP
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 10), // Space after OTP

            // Resend text row
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min, // Wraps content
                children: [
                  const Text(
                    "didn’t receive the code? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF8D8D8D), // Light grey text
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Code to resend OTP goes here
                    },
                    splashColor: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      child: Text(
                        "Resend",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111111), // Black
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20), // Space before button

            // Verify button
            Center(
              child: SizedBox(
                width: 343,
                height: 59,
                child: ElevatedButton(
                  onPressed: enteredOtp.length == 5
                      ? () {
                          // Add OTP verification logic here
                        }
                      : null, // Button disabled if OTP is incomplete
                  style: ElevatedButton.styleFrom(
                    backgroundColor: enteredOtp.length == 5
                        ? Colors.black // Active state color
                        : Color(0xFFD1D1D1), // Inactive/disabled state
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
