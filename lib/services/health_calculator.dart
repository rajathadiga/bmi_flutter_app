class HealthCalculator {
  static double calculateBMI(double weightKg, double heightCm) {
    double heightM = heightCm / 100;
    return double.parse((weightKg / (heightM * heightM)).toStringAsFixed(2));
  }

  static String getBMICategory(double bmi) {
    if (bmi < 18.5) return "Underweight";
    if (bmi < 25) return "Normal weight";
    if (bmi < 30) return "Overweight";
    return "Obese";
  }

  static double calculateBMR(double weightKg, double heightCm, int age, String gender) {
    if (gender.toLowerCase() == "male") {
      return double.parse((10 * weightKg + 6.25 * heightCm - 5 * age + 5).toStringAsFixed(2));
    } else if (gender.toLowerCase() == "female") {
      return double.parse((10 * weightKg + 6.25 * heightCm - 5 * age - 161).toStringAsFixed(2));
    } else {
      throw Exception("Gender must be male or female");
    }
  }

  static double calculateTDEE(double bmr, String activityLevel) {
    final activityFactors = {
      'sedentary': 1.2,
      'light': 1.375,
      'moderate': 1.55,
      'active': 1.725,
      'very active': 1.9,
    };

    return double.parse((bmr * (activityFactors[activityLevel.toLowerCase()] ?? 1.2)).toStringAsFixed(2));
  }

  static Map<String, int> calculateMacros(double tdee) {
    double proteinCal = 0.3 * tdee;
    double fatCal = 0.25 * tdee;
    double carbsCal = tdee - proteinCal - fatCal;

    return {
      'protein_g': (proteinCal / 4).round(),
      'fat_g': (fatCal / 9).round(),
      'carbs_g': (carbsCal / 4).round(),
    };
  }

  static String healthAdvice(String category) {
    switch (category) {
      case "Underweight":
        return "You are underweight. Increase calorie intake with healthy, nutrient-rich foods.";
      case "Normal weight":
        return "You have a healthy weight. Maintain with balanced nutrition and exercise.";
      case "Overweight":
        return "You are overweight. Try a slight calorie deficit and increase physical activity.";
      default:
        return "Obese. Please consult a doctor or certified nutritionist.";
    }
  }
}
