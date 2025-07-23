import 'package:flutter/material.dart';
import '../services/health_calculator.dart';
import 'chat_screen.dart'; // new file you must create

class ResultScreen extends StatelessWidget {
  final int age;
  final String gender;
  final double height;
  final double weight;
  final String activity;

  const ResultScreen({
    super.key,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    final bmi = HealthCalculator.calculateBMI(weight, height);
    final category = HealthCalculator.getBMICategory(bmi);
    final bmr = HealthCalculator.calculateBMR(weight, height, age, gender);
    final tdee = HealthCalculator.calculateTDEE(bmr, activity);
    final macros = HealthCalculator.calculateMacros(tdee);
    final advice = HealthCalculator.healthAdvice(category);

    return Scaffold(
      appBar: AppBar(title: Text("Results")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          Text("BMI: $bmi ($category)"),
          Text("BMR: $bmr kcal/day"),
          Text("TDEE: $tdee kcal/day"),
          Text("Protein: ${macros['protein_g']}g"),
          Text("Fat: ${macros['fat_g']}g"),
          Text("Carbs: ${macros['carbs_g']}g"),
          SizedBox(height: 20),
          Text("Advice: $advice"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatScreen()),
              );
            },
            child: const Text("Ask AI About Food (Chat)"),
          )
        ]),
      ),
    );
  }
}
