import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/stat_card.dart';
import '../widgets/skill_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.whatshot_outlined,
                    color: Colors.red[200], size: 28),
                onPressed: () {},
              ),
              const Positioned(
                right: 4,
                top: 4,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Text("3",
                      style: TextStyle(fontSize: 12, color: Colors.red)),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Circular Avatar with Shadow
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/baby.svg',
                  fit: BoxFit.cover,
                  placeholderBuilder: (_) => Container(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Name Styling
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Juan Jr. ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '(Sara’s baby)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            const Text("00y 7m 12d",
                style: TextStyle(color: Colors.blue, fontSize: 14)),

            const SizedBox(height: 10),

            // Flat Blue Edit Button
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF407BFF),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Edit",
                  style: TextStyle(color: Colors.white, fontSize: 14)),
            ),

            const SizedBox(height: 16),

            // Stat Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                StatCard(label: "Weight", value: "8kg"),
                StatCard(label: "Height", value: "69.2 cm"),
              ],
            ),

            const SizedBox(height: 20),

            // Skill Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.05,
                  children: const [
                    SkillCard(
                      title: "Fine\nMotor Skills",
                      value: 3.5,
                      color: Color(0xFFDFF8E5),
                    ),
                    SkillCard(
                      title: "Gross\nMotor Skills",
                      value: 3.5,
                      color: Color(0xFFDDEAFE),
                    ),
                    SkillCard(
                      title: "Sensory\nDevelopment",
                      value: 3.5,
                      color: Color(0xFFFFE5E5),
                    ),
                    SkillCard(
                      title: "Communication\nSkills",
                      value: 3.5,
                      color: Color(0xFFFFF5CC),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'bondy'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports), label: 'activities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: 'pediatricians'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
