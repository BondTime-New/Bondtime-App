import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceAssistanceScreen extends StatefulWidget {
  @override
  _VoiceAssistanceScreenState createState() => _VoiceAssistanceScreenState();
}

class _VoiceAssistanceScreenState extends State<VoiceAssistanceScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool isPlaying = false;
  bool hasCompleted = false; // Track if TTS has completed

  String guidanceText =
      "Let’s have fun building a tower together! Get ready with some colorful blocks. Don’t worry if they are of different shapes or sizes";

  @override
  void initState() {
    super.initState();

    // Set TTS completion handler
    flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
        hasCompleted = true; // Set to true when TTS completes
      });
    });
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> togglePlayPause() async {
    // If TTS has completed, replay the text
    if (hasCompleted) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(guidanceText);
      setState(() {
        isPlaying = true;
        hasCompleted = false; // Reset after replay starts
      });
    } 
    else if (isPlaying) {
      await flutterTts.pause();
      setState(() {
        isPlaying = false;
      });
    } 
    else {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(guidanceText);
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            flutterTts.stop();
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'BondTime',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Voice Assistance',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100), // Top padding of 215 px

          // Replaced Icon with the new SVG
          Center(
            child: SvgPicture.asset(
              'assets/icons/voice_assistance.svg',
              width: 159,
              height: 106,
              color: Colors.black,
            ),
          ),

          SizedBox(height: 40),

          // Instruction Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              guidanceText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Spacer(),

          // Control Buttons (Play Button Moved Up)
          Padding(
            padding: const EdgeInsets.only(bottom: 80), // Keeps all buttons up
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
              children: [
                // Previous Button
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Previous step',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                
                // Play/Pause/Replay Button (Moved Up with Transform)
                Transform.translate(
                  offset: Offset(0, -15), // Move Play button up by 15px
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        hasCompleted 
                          ? Icons.replay 
                          : (isPlaying ? Icons.pause : Icons.play_arrow), 
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: togglePlayPause,
                    ),
                  ),
                ),
                SizedBox(width: 40),
                
                // Next Button
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Next step',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Completed Button (Unchanged)
          // Completed Button (Updated)
Container(
  width: double.infinity,
  height: 58,
  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black, width: 1), // Reduced border width
  ),
  child: Center(
    child: Text(
      'Completed',
      style: TextStyle(
        fontSize: 16, // Changed text size to 16px
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  ),
),

          SizedBox(height: 40), // Space at the bottom
        ],
      ),
    );
  }
}