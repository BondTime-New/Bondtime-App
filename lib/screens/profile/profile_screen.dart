import 'package:flutter/material.dart';
import 'package:bondtime_app/screens/profile/widgets/profile_header.dart';
import 'package:bondtime_app/screens/profile/widgets/skill_card.dart';
import 'package:bondtime_app/screens/profile/widgets/dynamic_growth_chart.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Dynamic Weight Data
  List<double> weightData = [10, 15, 20, 25, 30, 35, 40, 50, 60, 70, 65, 68];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              const ProfileHeader(),
              const SizedBox(height: 10),

              // Weight and Height Cards with Strokes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.shade400, // Stroke Color
                            width: 1.5, // Stroke Width
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Weight",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "8.0kg",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey.shade400, // Stroke Color
                            width: 1.5, // Stroke Width
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "69.2 cm",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Skill Cards with Strokes
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: SkillCard(
                            skillName: "Fine Motor Skills",
                            score: 3.5,
                            backgroundColor: Color(0xFFE0F7FA),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SkillCard(
                            skillName: "Gross Motor Skills",
                            score: 3.5,
                            backgroundColor: Color(0xFFE8EAF6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Expanded(
                          child: SkillCard(
                            skillName: "Sensory Development",
                            score: 3.5,
                            backgroundColor: Color(0xFFFFEBEE),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: SkillCard(
                            skillName: "Communication Skills",
                            score: 3.5,
                            backgroundColor: Color(0xFFFFF3E0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Dynamic Growth Chart with Weight Data
              DynamicGrowthChart(weightData: weightData),
            ],
          ),
        ),
      ),
    );
  }
}
