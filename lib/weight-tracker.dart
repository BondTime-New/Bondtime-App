import 'package:flutter/material.dart';

void main() {
  runApp(WeightTrackerApp());
}

class WeightTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weight Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeightTrackerScreen(),
    );
  }
}

class WeightTrackerScreen extends StatefulWidget {
  @override
  _WeightTrackerScreenState createState() => _WeightTrackerScreenState();
}

class _WeightTrackerScreenState extends State<WeightTrackerScreen> {
  final List<double> _weights = [];
  final TextEditingController _controller = TextEditingController();

  void _addWeight() {
    final double? weight = double.tryParse(_controller.text);
    if (weight != null) {
      setState(() {
        _weights.add(weight);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter your weight',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addWeight,
              child: Text('Add Weight'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _weights.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Weight: ${_weights[index]} kg'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}