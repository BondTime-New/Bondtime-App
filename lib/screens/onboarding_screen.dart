import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isPageViewBuilt = false; // Track if the PageView is built

  @override
  void initState() {
    super.initState();
    // Delay the access to PageController.page to make sure the PageView is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isPageViewBuilt = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Only show the back button if we're not on the first page
          if (_isPageViewBuilt && _pageController.page != 0)
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 16), // Adjust padding to move it lower
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    if (_pageController.page! > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Color(0xFFC1C1C1), // Set the color to #C1C1C1
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                OnboardingWidget(
                  title: 'Welcome To',
                  subtitle: 'BondTime',
                  description:
                      'Strengthen your bond with your child through mindful, screen-free activities designed to support early development.',
                ),
                OnboardingWidget(
                  title: 'Discover tailored activities',
                  subtitle: '',
                  description:
                      'Discover activities tailored to your child\'s age and developmental stage, fostering a strong connection and healthy growth.',
                ),
                OnboardingWidget(
                  title: 'Track milestones',
                  subtitle: '',
                  description:
                      'Keep an eye on your child\'s development with our milestone tracker and weight monitor, celebrating every achievement together.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: CustomButton(
              label: _isPageViewBuilt && _pageController.page == 2
                  ? "Let’s Get Started"
                  : "Next",
              onPressed: () {
                if (_pageController.hasClients) {
                  if (_pageController.page == 2) {
                    // Navigate to the next screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtherScreen()),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;

  const OnboardingWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the title and subtitle text
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          if (subtitle.isNotEmpty) ...[
            SizedBox(height: 10),
            Text(
              subtitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
          SizedBox(height: 40),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}

class OtherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Other Screen')),
      body: Center(
        child: Text('Welcome to the main app!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
