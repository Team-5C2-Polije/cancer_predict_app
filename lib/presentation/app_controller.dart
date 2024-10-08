import 'package:cancer_predict_app/presentation/dialog/loading_dialog.dart';
import 'package:cancer_predict_app/presentation/dialog/result_dialog.dart';
import 'package:cancer_predict_app/domain/entity/cancer_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../domain/usecase/cancer_usecase.dart';

class AppController extends GetxController {
  // final PredictCancerUseCase predictCancerUseCase;

  final PredictCancerUseCase predictCancerUseCase;
  var excelData = <RxList<dynamic>>[].obs;
  AppController(this.predictCancerUseCase);

  var slidePos = 1.obs;
  var predictionResult = PatientEntity().obs;

  var isInfoPatientValid = false.obs;
  var isEnviromentalValid = false.obs;
  var isMedicalHistoryValid = false.obs;
  var isMainSymptomValid = false.obs;
  var isAdditionalSymptom = false.obs;

  // page 1
  var inpPatient = TextEditingController().obs;
  var inpAge = TextEditingController().obs;
  var inpGender = TextEditingController().obs;

  // page 2
  var inpAirPollution = TextEditingController().obs;
  var inpAlcoholUse = TextEditingController().obs;
  var inpDustAllergy = TextEditingController().obs;
  var inpOccupationalHazards = TextEditingController().obs;
  var inpSmoking = TextEditingController().obs;
  var inpPassiveSmoker = TextEditingController().obs;

  // Input controller untuk riwayat medis
  var inpGeneticRisk = TextEditingController().obs;
  var inpChronicLungDisease = TextEditingController().obs;
  var inpObesity = TextEditingController().obs;
  var inpBalancedDiet = TextEditingController().obs;

  // Input controller untuk riwayat medis tambahan
  var inpChestPain = TextEditingController().obs;
  var inpCoughingOfBlood = TextEditingController().obs;
  var inpFatigue = TextEditingController().obs;
  var inpWeightLoss = TextEditingController().obs;
  var inpShortnessOfBreath = TextEditingController().obs;
  var inpWheezing = TextEditingController().obs;

  // Input controller untuk riwayat medis tambahan lainnya
  var inpSwallowingDifficulty = TextEditingController().obs;
  var inpClubbingOfFingerNails = TextEditingController().obs;
  var inpFrequentCold = TextEditingController().obs;
  var inpDryCough = TextEditingController().obs;
  var inpSnoring = TextEditingController().obs;

  @override
  void onInit() async{
    super.onInit();
    await loadExcelData();
  }

  void onChangePatient() {
    String patientText = inpPatient.value.text.trim();
    String ageText = inpAge.value.text.trim();
    String genderText = inpGender.value.text.trim();
    isInfoPatientValid.value =
        patientText.isNotEmpty && ageText.isNotEmpty && genderText.isNotEmpty;
  }

  void onChangeEnvironmental() {
    String airPollutionText = inpAirPollution.value.text.trim();
    String alcoholUseText = inpAlcoholUse.value.text.trim();
    String dustAllergyText = inpDustAllergy.value.text.trim();
    String occupationalHazardsText = inpOccupationalHazards.value.text.trim();
    String smokingText = inpSmoking.value.text.trim();
    String passiveSmokerText = inpPassiveSmoker.value.text.trim();

    isEnviromentalValid.value = airPollutionText.isNotEmpty &&
        alcoholUseText.isNotEmpty &&
        dustAllergyText.isNotEmpty &&
        occupationalHazardsText.isNotEmpty &&
        smokingText.isNotEmpty &&
        passiveSmokerText.isNotEmpty;
  }

  void onChangeMedicalHistory() {
    String geneticRiskText = inpGeneticRisk.value.text.trim();
    String chronicLungDiseaseText = inpChronicLungDisease.value.text.trim();
    String obesityText = inpObesity.value.text.trim();
    String balancedDietText = inpBalancedDiet.value.text.trim();

    isMedicalHistoryValid.value = geneticRiskText.isNotEmpty &&
        chronicLungDiseaseText.isNotEmpty &&
        obesityText.isNotEmpty &&
        balancedDietText.isNotEmpty;
  }

  void onChangeMainSymptom() {
    String chestPainText = inpChestPain.value.text.trim();
    String coughingOfBloodText = inpCoughingOfBlood.value.text.trim();
    String fatigueText = inpFatigue.value.text.trim();
    String weightLossText = inpWeightLoss.value.text.trim();
    String shortnessOfBreathText = inpShortnessOfBreath.value.text.trim();
    String wheezingText = inpWheezing.value.text.trim();

    isMainSymptomValid.value = chestPainText.isNotEmpty &&
        coughingOfBloodText.isNotEmpty &&
        fatigueText.isNotEmpty &&
        weightLossText.isNotEmpty &&
        shortnessOfBreathText.isNotEmpty &&
        wheezingText.isNotEmpty;
  }

  void onChangeAdditionalSymptom() {
    String swallowingDifficultyText = inpSwallowingDifficulty.value.text.trim();
    String clubbingOfFingerNailsText =
        inpClubbingOfFingerNails.value.text.trim();
    String frequentColdText = inpFrequentCold.value.text.trim();
    String dryCoughText = inpDryCough.value.text.trim();
    String snoringText = inpSnoring.value.text.trim();

    isAdditionalSymptom.value = swallowingDifficultyText.isNotEmpty &&
        clubbingOfFingerNailsText.isNotEmpty &&
        frequentColdText.isNotEmpty &&
        dryCoughText.isNotEmpty &&
        snoringText.isNotEmpty;
  }

  int toInt(String str) {
    try {
      return int.tryParse(str) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  void clearAllData(){
    isAdditionalSymptom.value = false;
    isMedicalHistoryValid.value = false;
    isMainSymptomValid.value = false;
    isEnviromentalValid.value = false;
    isInfoPatientValid.value = false;

    // Page 1
    inpPatient.value.clear();
    inpAge.value.clear();
    inpGender.value.clear();

    // Page 2
    inpAirPollution.value.clear();
    inpAlcoholUse.value.clear();
    inpDustAllergy.value.clear();
    inpOccupationalHazards.value.clear();
    inpSmoking.value.clear();
    inpPassiveSmoker.value.clear();

    // Input controller untuk riwayat medis
    inpGeneticRisk.value.clear();
    inpChronicLungDisease.value.clear();
    inpObesity.value.clear();
    inpBalancedDiet.value.clear();

    // Input controller untuk riwayat medis tambahan
    inpChestPain.value.clear();
    inpCoughingOfBlood.value.clear();
    inpFatigue.value.clear();
    inpWeightLoss.value.clear();
    inpShortnessOfBreath.value.clear();
    inpWheezing.value.clear();

    // Input controller untuk riwayat medis tambahan lainnya
    inpSwallowingDifficulty.value.clear();
    inpClubbingOfFingerNails.value.clear();
    inpFrequentCold.value.clear();
    inpDryCough.value.clear();
    inpSnoring.value.clear();
  }

  Future<void> predict() async {
    if (!isAdditionalSymptom.value ||
        !isMainSymptomValid.value ||
        !isInfoPatientValid.value ||
        !isMedicalHistoryValid.value ||
        !isEnviromentalValid.value) {
      Get.snackbar(
        "Data tidak lengkap",
        "Mohon lengkapi semua informasi yang diperlukan sebelum melanjutkan.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
      return;
    } else {
      LoadingDialog.showLoadingDialog();
      await Future.delayed(const Duration(seconds: 3));
      Get.back();
    }

    try {
      var entity = PatientEntity(
        patientId: inpPatient.value.text,
        accuracy: 0,
        age: int.parse(inpAge.value.text),
        gender: int.parse(inpGender.value.text),
        airPollution: int.parse(inpAirPollution.value.text),
        alcoholUse: int.parse(inpAlcoholUse.value.text),
        dustAllergy: int.parse(inpDustAllergy.value.text),
        occupationalHazards: int.parse(inpOccupationalHazards.value.text),
        geneticRisk: int.parse(inpGeneticRisk.value.text),
        chronicLungDisease: int.parse(inpChronicLungDisease.value.text),
        balancedDiet: int.parse(inpBalancedDiet.value.text),
        obesity: int.parse(inpObesity.value.text),
        smoking: int.parse(inpSmoking.value.text),
        passiveSmoker: int.parse(inpPassiveSmoker.value.text),
        chestPain: int.parse(inpChestPain.value.text),
        coughingOfBlood: int.parse(inpCoughingOfBlood.value.text),
        fatigue: int.parse(inpFatigue.value.text),
        weightLoss: int.parse(inpWeightLoss.value.text),
        shortnessOfBreath: int.parse(inpShortnessOfBreath.value.text),
        wheezing: int.parse(inpWheezing.value.text),
        swallowingDifficulty: int.parse(inpSwallowingDifficulty.value.text),
        clubbingOfFingerNails: int.parse(inpClubbingOfFingerNails.value.text),
        frequentCold: int.parse(inpFrequentCold.value.text),
        dryCough: int.parse(inpDryCough.value.text),
        snoring: int.parse(inpSnoring.value.text),
      );

      var tempEntity = await predictCancerUseCase(entity);
      predictionResult.value = entity.copyWith(
        level: tempEntity.level,
        accuracy: tempEntity.accuracy,
      );

      ResultDialog(
        data: predictionResult.value,
        controller: Get.find<AppController>(),
      ).showResultDialog();
    } catch (e, s) {
      Logger().e(': $e | $s');
      Get.snackbar(
        "Error during prediction",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }

  }

  Future<void> loadExcelData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      String filePath = '${directory.path}/patient_data.xlsx';
      File file = File(filePath);

      if (await file.exists()) {
        var bytes = file.readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        Sheet? sheet = excel['Patients'];
        List<RxList<dynamic>> rows = [];
        for (var row in sheet.rows) {
          rows.add(row.map((cell) => cell?.value ?? '').toList().obs);
        }

        excelData.value = rows;
      }
    } catch (e) {
      Get.snackbar(
        "Error during load excel",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        borderRadius: 8,
        duration: const Duration(seconds: 3),
      );
    }
  }

  Future<void> savePatientDataToExcel() async {
    var excel;
    Sheet? sheetObject;
    PatientEntity patient = predictionResult.value;

    try {
      final directory = await getApplicationDocumentsDirectory();
      String outputPath = '${directory.path}/patient_data.xlsx';
      File file = File(outputPath);

      if (await file.exists()) {
        var bytes = file.readAsBytesSync();
        excel = Excel.decodeBytes(bytes);
        sheetObject = excel['Patients'];
      } else {
        excel = Excel.createExcel();
        sheetObject = excel['Patients'];
        sheetObject?.appendRow([
          'Patient ID', 'Accuracy', 'Age', 'Gender', 'Air Pollution', 'Alcohol Use',
          'Dust Allergy', 'Occupational Hazards', 'Genetic Risk', 'Chronic Lung Disease',
          'Balanced Diet', 'Obesity', 'Smoking', 'Passive Smoker', 'Chest Pain',
          'Coughing of Blood', 'Fatigue', 'Weight Loss', 'Shortness of Breath',
          'Wheezing', 'Swallowing Difficulty', 'Clubbing of Finger Nails',
          'Frequent Cold', 'Dry Cough', 'Snoring', 'Level'
        ]);
      }

      sheetObject!.appendRow([
        patient.patientId,
        patient.accuracy,
        patient.age,
        patient.gender,
        patient.airPollution,
        patient.alcoholUse,
        patient.dustAllergy,
        patient.occupationalHazards,
        patient.geneticRisk,
        patient.chronicLungDisease,
        patient.balancedDiet,
        patient.obesity,
        patient.smoking,
        patient.passiveSmoker,
        patient.chestPain,
        patient.coughingOfBlood,
        patient.fatigue,
        patient.weightLoss,
        patient.shortnessOfBreath,
        patient.wheezing,
        patient.swallowingDifficulty,
        patient.clubbingOfFingerNails,
        patient.frequentCold,
        patient.dryCough,
        patient.snoring,
        patient.level,
      ]);

      file.writeAsBytesSync(excel.encode()!);

      Get.defaultDialog(
        title: "Success",
        middleText: "Patient data saved to Excel successfully! \n Data tersimpan di $directory\\patient_data.xlsx",
        textConfirm: "OK",
        confirmTextColor: Colors.white,
        onConfirm: () {
          Get.back();
        },
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to save patient data: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}
