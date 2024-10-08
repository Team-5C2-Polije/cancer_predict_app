import 'package:cancer_predict_app/domain/entity/cancer_entity.dart';

class PatientModel {
  final String patientId;
  final double accuracy; // Jangan lupa untuk menambahkan accuracy jika perlu
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
    required this.accuracy, // Pastikan menambah parameter accuracy
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
      'accuracy': accuracy, // Pastikan menambahkan accuracy di sini juga
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

  // Metode fromJson untuk membuat instance PatientModel dari JSON
  factory PatientModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError("JSON map cannot be null");
    }

    return PatientModel(
      patientId: json['patient_id'] as String? ?? '',
      accuracy: (json['accuracy'] as num?)?.toDouble() ?? 0.0, // Handling null for accuracy and converting to double
      age: json['age'] as int? ?? 0,
      gender: json['gender'] as int? ?? 0,
      airPollution: json['air_pollution'] as int? ?? 0,
      alcoholUse: json['alcohol_use'] as int? ?? 0,
      dustAllergy: json['dust_allergy'] as int? ?? 0,
      occupationalHazards: json['occupational_hazards'] as int? ?? 0,
      geneticRisk: json['genetic_risk'] as int? ?? 0,
      chronicLungDisease: json['chronic_lung_disease'] as int? ?? 0,
      balancedDiet: json['balanced_diet'] as int? ?? 0,
      obesity: json['obesity'] as int? ?? 0,
      smoking: json['smoking'] as int? ?? 0,
      passiveSmoker: json['passive_smoker'] as int? ?? 0,
      chestPain: json['chest_pain'] as int? ?? 0,
      coughingOfBlood: json['coughing_of_blood'] as int? ?? 0,
      fatigue: json['fatigue'] as int? ?? 0,
      weightLoss: json['weight_loss'] as int? ?? 0,
      shortnessOfBreath: json['shortness_of_breath'] as int? ?? 0,
      wheezing: json['wheezing'] as int? ?? 0,
      swallowingDifficulty: json['swallowing_difficulty'] as int? ?? 0,
      clubbingOfFingerNails: json['clubbing_of_finger_nails'] as int? ?? 0,
      frequentCold: json['frequent_cold'] as int? ?? 0,
      dryCough: json['dry_cough'] as int? ?? 0,
      snoring: json['snoring'] as int? ?? 0,
      level: json['level'] as String? ?? '',
    );
  }


  PatientEntity toEntity() {
    return PatientEntity(
      patientId: patientId,
      accuracy: accuracy,
      age: age,
      gender: gender,
      airPollution: airPollution,
      alcoholUse: alcoholUse,
      dustAllergy: dustAllergy,
      occupationalHazards: occupationalHazards,
      geneticRisk: geneticRisk,
      chronicLungDisease: chronicLungDisease,
      balancedDiet: balancedDiet,
      obesity: obesity,
      smoking: smoking,
      passiveSmoker: passiveSmoker,
      chestPain: chestPain,
      coughingOfBlood: coughingOfBlood,
      fatigue: fatigue,
      weightLoss: weightLoss,
      shortnessOfBreath: shortnessOfBreath,
      wheezing: wheezing,
      swallowingDifficulty: swallowingDifficulty,
      clubbingOfFingerNails: clubbingOfFingerNails,
      frequentCold: frequentCold,
      dryCough: dryCough,
      snoring: snoring,
      level: level,
    );
  }

}
