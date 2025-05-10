import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// This is the Sign In screen where users can log in with email and password
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Controllers to handle email and password input
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Toggles password visibility
  bool _isPasswordVisible = false;

  // Tracks if form input is valid
  bool _isFormValid = false;

  // Holds email validation error
  String? _emailError;

  @override
  void initState() {
    super.initState();

    // Add listeners to input fields to validate form in real-time
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Clean up controllers
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Validates both email and password inputs
  void _validateForm() {
    setState(() {
      _emailError = _validateEmail(_emailController.text);
      _isFormValid = _emailController.text.isNotEmpty &&
          _emailError == null &&
          _passwordController.text.isNotEmpty;
    });
  }

  // Simple email validation using RegEx
  String? _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (email.isEmpty) return null; // Don't show error if field is empty
    if (!emailRegex.hasMatch(email)) return "Enter a valid email";
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Top AppBar with a back button
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back
            },
            splashRadius: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      // Body with scrollable content
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Title
            const Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Email Text Field with validation
            _buildTextField("Enter your mail", _emailController, false,
                "assets/images/email.svg",
                errorText: _emailError),

            // Show error below if email is invalid
            if (_emailError != null)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  _emailError!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),

            const SizedBox(height: 20),

            // Password Text Field
            _buildTextField("Enter your password", _passwordController, true,
                "assets/images/pw.svg"),

            const SizedBox(height: 20),

            // Sign In Button (disabled if form is invalid)
            ElevatedButton(
              onPressed: _isFormValid ? () {} : null, // Add sign-in logic here
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isFormValid ? Colors.black : const Color(0xFFA0A0A0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            // Forgot password button
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/otp-verification'); // Go to OTP screen
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(const Color(0xFF676767)),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color(0xFFD1D1D1);
                      }
                      return null;
                    },
                  ),
                ),
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color(0xFF676767)),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Divider line with "or"
            Row(
              children: const [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("or"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            // Social Login Buttons
            _buildSocialButton(
                "Continue with Apple", "assets/images/apple.svg"),
            const SizedBox(height: 15),
            _buildSocialButton(
                "Continue with Google", "assets/images/google.svg"),
            const SizedBox(height: 15),
            _buildSocialButton(
                "Continue with Facebook", "assets/images/facebook.svg"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Text field builder used for both email and password
  Widget _buildTextField(
    String hint,
    TextEditingController controller,
    bool isPassword,
    String iconPath, {
    String? errorText,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !_isPasswordVisible : false, // Hide password
      onChanged: (_) => _validateForm(), // Re-check form validity
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFFC5C5C5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

        // Icon shown at start of text field
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset(iconPath, width: 24, height: 24),
        ),

        // Show/hide password toggle
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,

        // Text field borders
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Color(0xFFD1D1D1),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  // Social login button builder
  Widget _buildSocialButton(String text, String iconPath) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFFD1D1D1)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
