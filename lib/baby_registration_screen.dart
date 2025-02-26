import 'package:flutter/material.dart';

class BabyRegistrationScreen extends StatefulWidget {
  const BabyRegistrationScreen({super.key});

  @override
  _BabyRegistrationScreenState createState() => _BabyRegistrationScreenState();
}

class _BabyRegistrationScreenState extends State<BabyRegistrationScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _dobFocus = FocusNode();
  final FocusNode _weightFocus = FocusNode();
  final FocusNode _heightFocus = FocusNode();

  String? _selectedGender;

  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_validateForm);
    _lastNameController.addListener(_validateForm);
    _dobController.addListener(_validateForm);
    _weightController.addListener(_validateForm);
    _heightController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
    _weightController.dispose();
    _heightController.dispose();

    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _dobFocus.dispose();
    _weightFocus.dispose();
    _heightFocus.dispose();

    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _dobController.text.isNotEmpty &&
          _weightController.text.isNotEmpty &&
          _heightController.text.isNotEmpty &&
          _selectedGender != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Prevents overflow issues
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
              "Tell us about your baby",
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
            _buildLabeledTextField("Enter Your Baby’s Name", "First Name",
                _firstNameController, _firstNameFocus),
            const SizedBox(height: 20),
            _buildLabeledTextField(
                "", "Last Name", _lastNameController, _lastNameFocus),
            const SizedBox(height: 20),
            _buildLabeledTextField(
                "Date of Birth", "dd/mm/yy", _dobController, _dobFocus,
                isDate: true),
            const SizedBox(height: 20),
            _buildGenderDropdown("Gender"),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildLabeledTextField("Current Weight", "Weight",
                      _weightController, _weightFocus,
                      suffix: "kg"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildLabeledTextField("Current Height", "Height",
                      _heightController, _heightFocus,
                      suffix: "cm"),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
            ElevatedButton(
              onPressed: _isFormValid ? () {} : null, // Enables when valid
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFormValid
                    ? const Color(0xFF111111)
                    : Colors.grey.shade400,
                minimumSize:
                    const Size(370, 58), // Changed width to 344, height to 58
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        15)), // Changed border radius to 15
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

  Widget _buildLabeledTextField(String label, String hint,
      TextEditingController controller, FocusNode focusNode,
      {bool isDate = false, String? suffix}) {
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
        _buildTextField(hint, controller, focusNode,
            isDate: isDate, suffix: suffix),
      ],
    );
  }

  Widget _buildTextField(
      String hint, TextEditingController controller, FocusNode focusNode,
      {bool isDate = false, String? suffix}) {
    return SizedBox(
      width: 370,
      height: 50,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        readOnly: isDate,
        keyboardType: isDate ? TextInputType.datetime : TextInputType.text,
        onTap: isDate
            ? () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  _dobController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                }
              }
            : null,
        style: const TextStyle(
          fontFamily: 'InterTight',
          fontSize: 14,
          color: Color(0xFF000000),
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'InterTight',
            fontSize: 14,
            color: Color(0xFFC5C5C5),
          ),
          suffixText: suffix,
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: Color(0xFFBDBDBD), // Ash color when unfocused
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: Colors.black, // Black color when focused
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown(String label) {
    return SizedBox(
      width: 370,
      height: 50,
      child: DropdownButtonFormField<String>(
        value: _selectedGender,
        items: ["Male", "Female", "Other"]
            .map((gender) =>
                DropdownMenuItem(value: gender, child: Text(gender)))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedGender = value;
            _validateForm();
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(
              color: Color(0xFFBDBDBD),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
