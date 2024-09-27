import '../entity/cancer_entity.dart';

abstract class PatientRepository {
  Future<String> predictCancer(PatientEntity patientEntity);
}
