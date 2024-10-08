class PatientEntity {
  final String? patientId;
  final double? accuracy;
  final int? age;
  final int? gender;
  final int? airPollution;
  final int? alcoholUse;
  final int? dustAllergy;
  final int? occupationalHazards;
  final int? geneticRisk;
  final int? chronicLungDisease;
  final int? balancedDiet;
  final int? obesity;
  final int? smoking;
  final int? passiveSmoker;
  final int? chestPain;
  final int? coughingOfBlood;
  final int? fatigue;
  final int? weightLoss;
  final int? shortnessOfBreath;
  final int? wheezing;
  final int? swallowingDifficulty;
  final int? clubbingOfFingerNails;
  final int? frequentCold;
  final int? dryCough;
  final int? snoring;
  final String? level;

  PatientEntity({
    this.patientId,
    this.accuracy,
    this.age,
    this.gender,
    this.airPollution,
    this.alcoholUse,
    this.dustAllergy,
    this.occupationalHazards,
    this.geneticRisk,
    this.chronicLungDisease,
    this.balancedDiet,
    this.obesity,
    this.smoking,
    this.passiveSmoker,
    this.chestPain,
    this.coughingOfBlood,
    this.fatigue,
    this.weightLoss,
    this.shortnessOfBreath,
    this.wheezing,
    this.swallowingDifficulty,
    this.clubbingOfFingerNails,
    this.frequentCold,
    this.dryCough,
    this.snoring,
    this.level,
  });

  PatientEntity copyWith({
    String? patientId,
    double? accuracy,
    int? age,
    int? gender,
    int? airPollution,
    int? alcoholUse,
    int? dustAllergy,
    int? occupationalHazards,
    int? geneticRisk,
    int? chronicLungDisease,
    int? balancedDiet,
    int? obesity,
    int? smoking,
    int? passiveSmoker,
    int? chestPain,
    int? coughingOfBlood,
    int? fatigue,
    int? weightLoss,
    int? shortnessOfBreath,
    int? wheezing,
    int? swallowingDifficulty,
    int? clubbingOfFingerNails,
    int? frequentCold,
    int? dryCough,
    int? snoring,
    String? level,
  }) {
    return PatientEntity(
      patientId: patientId ?? this.patientId,
      accuracy: accuracy ?? this.accuracy,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      airPollution: airPollution ?? this.airPollution,
      alcoholUse: alcoholUse ?? this.alcoholUse,
      dustAllergy: dustAllergy ?? this.dustAllergy,
      occupationalHazards: occupationalHazards ?? this.occupationalHazards,
      geneticRisk: geneticRisk ?? this.geneticRisk,
      chronicLungDisease: chronicLungDisease ?? this.chronicLungDisease,
      balancedDiet: balancedDiet ?? this.balancedDiet,
      obesity: obesity ?? this.obesity,
      smoking: smoking ?? this.smoking,
      passiveSmoker: passiveSmoker ?? this.passiveSmoker,
      chestPain: chestPain ?? this.chestPain,
      coughingOfBlood: coughingOfBlood ?? this.coughingOfBlood,
      fatigue: fatigue ?? this.fatigue,
      weightLoss: weightLoss ?? this.weightLoss,
      shortnessOfBreath: shortnessOfBreath ?? this.shortnessOfBreath,
      wheezing: wheezing ?? this.wheezing,
      swallowingDifficulty: swallowingDifficulty ?? this.swallowingDifficulty,
      clubbingOfFingerNails: clubbingOfFingerNails ?? this.clubbingOfFingerNails,
      frequentCold: frequentCold ?? this.frequentCold,
      dryCough: dryCough ?? this.dryCough,
      snoring: snoring ?? this.snoring,
      level: level ?? this.level,
    );
  }

}
