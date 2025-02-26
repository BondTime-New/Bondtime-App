import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  bool _isFormValid = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  String? _emailError;
  String? _passwordError;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
    _confirmPasswordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

    super.dispose();
  }

  void _validateForm() {
    _validateEmail();
    _validatePassword();

    setState(() {
      _isFormValid = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _emailError == null &&
          _passwordError == null;
    });
  }

  void _validateEmail() {
    final email = _emailController.text;
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      _emailError = "Please enter a valid email address";
    } else {
      _emailError = null;
    }
  }

  void _validatePassword() {
    if (_passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordController.text != _confirmPasswordController.text) {
      _passwordError = "Passwords do not match";
    } else {
      _passwordError = null;
    }
  }

  void _onSubmit() {
    _validateForm();

    if (_isFormValid) {
      print("Form is valid!");
    }
  }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tell us about you",
              style: TextStyle(
                fontFamily: 'InterTight',
                fontSize: 32.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111111),
              ),
            ),
            const SizedBox(height: 34),
            const Text(
              "Every detail helps us support your baby’s journey.",
              style: TextStyle(
                fontFamily: 'InterTight',
                fontSize: 17.2,
                fontWeight: FontWeight.w300,
                color: Color(0xFF8D8D8D),
              ),
            ),
            const SizedBox(height: 34),

            _buildLabeledTextField("Enter Your Name", "First Name",
                _firstNameController, _firstNameFocus),
            const SizedBox(height: 20),
            _buildLabeledTextField(
                "", "Last Name", _lastNameController, _lastNameFocus),
            const SizedBox(height: 20),

            _buildLabeledTextField(
              "Enter Your Email",
              "example@email.com",
              _emailController,
              _emailFocus,
              errorText: _emailError,
            ),
            const SizedBox(height: 20),

            _buildLabeledTextField(
              "Create a Strong Password",
              "Enter a password",
              _passwordController,
              _passwordFocus,
              isPassword: true,
              isPasswordVisible: _isPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildLabeledTextField(
              "",
              "Re-enter the password",
              _confirmPasswordController,
              _confirmPasswordFocus,
              isPassword: true,
              isPasswordVisible: _isConfirmPasswordVisible,
              togglePasswordVisibility: () {
                setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                });
              },
              errorText: _passwordError,
            ),
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
            const SizedBox(height: 40),

            /// **Next Button**
            ElevatedButton(
              onPressed: _isFormValid ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFormValid
                    ? const Color(0xFF111111)
                    : Colors.grey.shade400,
                minimumSize: const Size(370, 58),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildLabeledTextField(
    String label,
    String hint,
    TextEditingController controller,
    FocusNode focusNode, {
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? togglePasswordVisibility,
    String? errorText,
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
        TextField(
          controller: controller,
          focusNode: focusNode,
          obscureText: isPassword && !isPasswordVisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            errorText: errorText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: togglePasswordVisibility,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide:
                  const BorderSide(color: Color(0xFFBDBDBD), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
