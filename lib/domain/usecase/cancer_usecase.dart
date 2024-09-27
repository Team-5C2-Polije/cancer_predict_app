import '../entity/cancer_entity.dart';
import '../repository/patient_repository.dart';

class PredictCancerUseCase {
  final PatientRepository repository;

  PredictCancerUseCase(this.repository);

  Future<String> call(PatientEntity patientEntity) async {
    return await repository.predictCancer(patientEntity);
  }
}
