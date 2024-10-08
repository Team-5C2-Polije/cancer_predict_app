import '../entity/cancer_entity.dart';

abstract class PatientRepository {
  Future<PatientEntity> predictCancer(PatientEntity patientEntity);
}
