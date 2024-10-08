import '../../domain/entity/cancer_entity.dart';
import '../../domain/repository/patient_repository.dart';
import '../model/cancer_model.dart';
import '../source/patient_datasource.dart';

class PatientRepositoryImpl implements PatientRepository {
  final PatientRemoteDataSource remoteDataSource;

  PatientRepositoryImpl(this.remoteDataSource);

  @override
  Future<PatientEntity> predictCancer(PatientEntity? patientEntity) async {
    if (patientEntity == null) {
      throw ArgumentError("PatientEntity cannot be null");
    }

    final patientModel = PatientModel(
      patientId: patientEntity.patientId ?? '',
      accuracy: patientEntity.accuracy ?? 0.0,
      age: patientEntity.age ?? 0,
      gender: patientEntity.gender ?? 0,
      airPollution: patientEntity.airPollution ?? 0,
      alcoholUse: patientEntity.alcoholUse ?? 0,
      dustAllergy: patientEntity.dustAllergy ?? 0,
      occupationalHazards: patientEntity.occupationalHazards ?? 0,
      geneticRisk: patientEntity.geneticRisk ?? 0,
      chronicLungDisease: patientEntity.chronicLungDisease ?? 0,
      balancedDiet: patientEntity.balancedDiet ?? 0,
      obesity: patientEntity.obesity ?? 0,
      smoking: patientEntity.smoking ?? 0,
      passiveSmoker: patientEntity.passiveSmoker ?? 0,
      chestPain: patientEntity.chestPain ?? 0,
      coughingOfBlood: patientEntity.coughingOfBlood ?? 0,
      fatigue: patientEntity.fatigue ?? 0,
      weightLoss: patientEntity.weightLoss ?? 0,
      shortnessOfBreath: patientEntity.shortnessOfBreath ?? 0,
      wheezing: patientEntity.wheezing ?? 0,
      swallowingDifficulty: patientEntity.swallowingDifficulty ?? 0,
      clubbingOfFingerNails: patientEntity.clubbingOfFingerNails ?? 0,
      frequentCold: patientEntity.frequentCold ?? 0,
      dryCough: patientEntity.dryCough ?? 0,
      snoring: patientEntity.snoring ?? 0,
      level: patientEntity.level ?? '',
    );

    var data = await remoteDataSource.predict(patientModel);
    return data.toEntity();
  }


}
