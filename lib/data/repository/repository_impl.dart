import '../../domain/entity/cancer_entity.dart';
import '../../domain/repository/patient_repository.dart';
import '../model/cancer_model.dart';
import '../source/patient_datasource.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource remoteDataSource;

  PatientRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> predictCancer(PatientEntity patientEntity) async {
    final patientModel = PatientModel(
      patientId: patientEntity.patientId,
      age: patientEntity.age,
      gender: patientEntity.gender,
      airPollution: patientEntity.airPollution,
      alcoholUse: patientEntity.alcoholUse,
      dustAllergy: patientEntity.dustAllergy,
      occupationalHazards: patientEntity.occupationalHazards,
      geneticRisk: patientEntity.geneticRisk,
      chronicLungDisease: patientEntity.chronicLungDisease,
      balancedDiet: patientEntity.balancedDiet,
      obesity: patientEntity.obesity,
      smoking: patientEntity.smoking,
      passiveSmoker: patientEntity.passiveSmoker,
      chestPain: patientEntity.chestPain,
      coughingOfBlood: patientEntity.coughingOfBlood,
      fatigue: patientEntity.fatigue,
      weightLoss: patientEntity.weightLoss,
      shortnessOfBreath: patientEntity.shortnessOfBreath,
      wheezing: patientEntity.wheezing,
      swallowingDifficulty: patientEntity.swallowingDifficulty,
      clubbingOfFingerNails: patientEntity.clubbingOfFingerNails,
      frequentCold: patientEntity.frequentCold,
      dryCough: patientEntity.dryCough,
      snoring: patientEntity.snoring,
      level: patientEntity.level ?? '',
    );
    return await remoteDataSource.predict(patientModel);
  }
}
