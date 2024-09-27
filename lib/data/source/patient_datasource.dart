import 'package:dio/dio.dart';

import '../model/cancer_model.dart';

class PatientRemoteDataSource {
  final Dio dio;

  PatientRemoteDataSource(this.dio);

  Future<String> predict(PatientModel patient) async {
    final response = await dio.post(
      'http://127.0.0.1:5000/predict',
      data: patient.toJson(),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );
    if (response.statusCode == 200) {
      return response.data['level'];
    } else {
      throw Exception('Failed to predict');
    }
  }
}
