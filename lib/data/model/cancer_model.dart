class PatientModel {
  final String patientId;
  final int age;
  final int gender;
  final int airPollution;
  final int alcoholUse;
  final int dustAllergy;
  final int occupationalHazards;
  final int geneticRisk;
  final int chronicLungDisease;
  final int balancedDiet;
  final int obesity;
  final int smoking;
  final int passiveSmoker;
  final int chestPain;
  final int coughingOfBlood;
  final int fatigue;
  final int weightLoss;
  final int shortnessOfBreath;
  final int wheezing;
  final int swallowingDifficulty;
  final int clubbingOfFingerNails;
  final int frequentCold;
  final int dryCough;
  final int snoring;
  final String level;

  PatientModel({
    required this.patientId,
    required this.age,
    required this.gender,
    required this.airPollution,
    required this.alcoholUse,
    required this.dustAllergy,
    required this.occupationalHazards,
    required this.geneticRisk,
    required this.chronicLungDisease,
    required this.balancedDiet,
    required this.obesity,
    required this.smoking,
    required this.passiveSmoker,
    required this.chestPain,
    required this.coughingOfBlood,
    required this.fatigue,
    required this.weightLoss,
    required this.shortnessOfBreath,
    required this.wheezing,
    required this.swallowingDifficulty,
    required this.clubbingOfFingerNails,
    required this.frequentCold,
    required this.dryCough,
    required this.snoring,
    required this.level,
  });

  Map<String, dynamic> toJson() {
    return {
      'patient_id': patientId,
      'age': age,
      'gender': gender,
      'air_pollution': airPollution,
      'alcohol_use': alcoholUse,
      'dust_allergy': dustAllergy,
      'occupational_hazards': occupationalHazards,
      'genetic_risk': geneticRisk,
      'chronic_lung_disease': chronicLungDisease,
      'balanced_diet': balancedDiet,
      'obesity': obesity,
      'smoking': smoking,
      'passive_smoker': passiveSmoker,
      'chest_pain': chestPain,
      'coughing_of_blood': coughingOfBlood,
      'fatigue': fatigue,
      'weight_loss': weightLoss,
      'shortness_of_breath': shortnessOfBreath,
      'wheezing': wheezing,
      'swallowing_difficulty': swallowingDifficulty,
      'clubbing_of_finger_nails': clubbingOfFingerNails,
      'frequent_cold': frequentCold,
      'dry_cough': dryCough,
      'snoring': snoring,
      'level': level,
    };
  }
}
