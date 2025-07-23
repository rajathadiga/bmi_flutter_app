import 'package:flutter/material.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>();
  int age = 0;
  String gender = 'male';
  double height = 0;
  double weight = 0;
  String activity = 'moderate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Health Advisor')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Age"),
              keyboardType: TextInputType.number,
              onSaved: (val) => age = int.parse(val!),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: "Gender"),
              value: gender,
              items: ['male', 'female'].map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
              onChanged: (val) => gender = val!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Height (cm)"),
              keyboardType: TextInputType.number,
              onSaved: (val) => height = double.parse(val!),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Weight (kg)"),
              keyboardType: TextInputType.number,
              onSaved: (val) => weight = double.parse(val!),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: "Activity Level"),
              value: activity,
              items: ['sedentary', 'light', 'moderate', 'active', 'very active']
                  .map((level) => DropdownMenuItem(value: level, child: Text(level)))
                  .toList(),
              onChanged: (val) => activity = val!,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Calculate"),
              onPressed: () {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(
                      age: age,
                      gender: gender,
                      height: height,
                      weight: weight,
                      activity: activity,
                    ),
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }
}
