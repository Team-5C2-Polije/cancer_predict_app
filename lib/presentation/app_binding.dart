import 'package:cancer_predict_app/presentation/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/repository/repository_impl.dart';
import '../data/source/patient_datasource.dart';
import '../domain/repository/patient_repository.dart';
import '../domain/usecase/cancer_usecase.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Dio dio = Dio();
    PatientRemoteDataSource remoteDataSource = PatientRemoteDataSource(dio);

    // Initialize Repository
    PatientRepository repository = PatientRepositoryImpl(remoteDataSource);

    // Initialize UseCase
    PredictCancerUseCase predictCancerUseCase = PredictCancerUseCase(repository);

    // Initialize Controller with the UseCase
    Get.put(AppController(predictCancerUseCase));
  }
}
