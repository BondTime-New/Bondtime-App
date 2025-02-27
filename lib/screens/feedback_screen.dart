import 'package:flutter/material.dart';
import 'difficulty_screen.dart'; // ✅ Ensure this import exists
import '../widgets/feedback_card.dart'; // ✅ Ensure correct import

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BondTime"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: FeedbackCard(
          question: "How did this activity go with your child?",
          onNext: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const DifficultyScreen()), // ✅ Ensure constructor is defined
            );
          },
          isLast: false,
        ),
      ),
    );
  }
}
