import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// This screen is for signing up a new user
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers to get text from the input fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form validation and UI control variables
  bool _isFormValid = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Error messages
  String? _emailError;
  String? _passwordError;
  bool _isEmailValid = true;

  @override
  void initState() {
    super.initState();

    // Adding listeners to validate the form when user types
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _emailController.addListener(() {
      _validateEmail(); // Validate email when typing
      _validateForm(); // Check overall form
    });
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    // Clean up controllers when screen is closed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // This checks if all fields are filled correctly
  void _validateForm() {
    _validatePassword(); // Check if passwords match

    setState(() {
      _isFormValid = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _isEmailValid &&
          _passwordError == null;
    });
  }

  // This validates the email format
  void _validateEmail() {
    final email = _emailController.text;
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    setState(() {
      _isEmailValid = email.isEmpty || emailRegex.hasMatch(email);
      _emailError = _isEmailValid ? null : "Please enter a valid email address";
    });
  }

  // Checks if both password fields match
  void _validatePassword() {
    if (_passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordController.text != _confirmPasswordController.text) {
      _passwordError = "Passwords do not match";
    } else {
      _passwordError = null;
    }
  }

  // Called when user taps the "Next" button
  void _onSubmit() {
    _validateForm(); // Double check before proceeding

    if (_isFormValid) {
      print("Form is valid!");

      // Navigate to the next screen (e.g., Baby Registration)
      Navigator.pushNamed(context, '/baby-registration');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // App bar with back button
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      // Page layout
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // Scrollable content area
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header title
                      const Text(
                        "Tell us about you",
                        style: TextStyle(
                          fontFamily: 'InterTight',
                          fontSize: 32.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111111),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      const Text(
                        "Every detail helps us support your baby’s journey.",
                        style: TextStyle(
                          fontFamily: 'InterTight',
                          fontSize: 17.2,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF8D8D8D),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // First name input
                      _buildLabeledTextField("Enter Your Name", "First Name",
                          _firstNameController),

                      const SizedBox(height: 14),

                      // Last name input
                      _buildLabeledTextField(
                          "", "Last Name", _lastNameController),

                      const SizedBox(height: 14),

                      // Email input with error check
                      _buildLabeledTextField(
                        "Enter Your Email",
                        "example@email.com",
                        _emailController,
                        errorText: _isEmailValid ? null : _emailError,
                        svgIconPath: "assets/images/email.svg",
                      ),

                      const SizedBox(height: 14),

                      // Password field with visibility toggle
                      _buildLabeledTextField(
                        "Create a Strong Password",
                        "Enter a password",
                        _passwordController,
                        isPassword: true,
                        isPasswordVisible: _isPasswordVisible,
                        togglePasswordVisibility: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        svgIconPath: "assets/images/pw.svg",
                      ),

                      const SizedBox(height: 14),

                      // Confirm password field
                      _buildLabeledTextField(
                        "",
                        "Re-enter the password",
                        _confirmPasswordController,
                        isPassword: true,
                        isPasswordVisible: _isConfirmPasswordVisible,
                        togglePasswordVisibility: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                        errorText: _passwordError,
                        svgIconPath: "assets/images/pw.svg",
                      ),
                    ],
                  ),
                ),
              ),

              // Footer note about data privacy
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "We collect this info to personalize activities and track growth. Your data is secure and used only to enhance your experience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF938E8A),
                  ),
                ),
              ),

              // "Next" button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: _isFormValid
                      ? _onSubmit
                      : null, // Disabled if form not ready
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isFormValid
                        ? const Color(0xFF111111)
                        : Colors.grey.shade400,
                    minimumSize: const Size(double.infinity, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'InterTight',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Reusable text field with optional label, password toggle, icon, and error message
  Widget _buildLabeledTextField(
    String label,
    String hint,
    TextEditingController controller, {
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? togglePasswordVisibility,
    String? errorText,
    String? svgIconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'InterTight',
              fontSize: 14.82,
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            ),
          ),
        if (label.isNotEmpty) const SizedBox(height: 5),

        // Actual input field
        TextField(
          controller: controller,
          obscureText: isPassword && !isPasswordVisible, // Hide password
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFBDBDBD)),
            errorText: errorText,
            prefixIcon: svgIconPath != null
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(svgIconPath, height: 20, width: 20),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
