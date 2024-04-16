class DailyMetrics {
  final int steps;
  final double waterIntake;
  final double calorieConsumption;

  DailyMetrics({
    required this.steps,
    required this.waterIntake,
    required this.calorieConsumption,
  });

  factory DailyMetrics.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return DailyMetrics(
      steps: json['steps'] ?? 0,
      waterIntake: double.parse((json['waterIntake'] ?? 0).toString()),
      calorieConsumption:
          double.parse((json['calorieConsumption'] ?? 0).toString()),
    );
  }
}
