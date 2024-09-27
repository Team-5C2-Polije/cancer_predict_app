import 'package:cancer_predict_app/domain/entity/cancer_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import '../domain/usecase/cancer_usecase.dart';

class AppController extends GetxController {
  // final PredictCancerUseCase predictCancerUseCase;

  final PredictCancerUseCase predictCancerUseCase;

  AppController(this.predictCancerUseCase);

  var slidePos = 1.obs;
  var predictionResult = ''.obs;

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

    // Periksa apakah semua input untuk faktor lingkungan tidak kosong
    isEnviromentalValid.value = airPollutionText.isNotEmpty &&
        alcoholUseText.isNotEmpty &&
        dustAllergyText.isNotEmpty &&
        occupationalHazardsText.isNotEmpty &&
        smokingText.isNotEmpty &&
        passiveSmokerText.isNotEmpty;
  }

  // Fungsi untuk memvalidasi riwayat medis
  void onChangeMedicalHistory() {
    String geneticRiskText = inpGeneticRisk.value.text.trim();
    String chronicLungDiseaseText = inpChronicLungDisease.value.text.trim();
    String obesityText = inpObesity.value.text.trim();
    String balancedDietText = inpBalancedDiet.value.text.trim();

    // Periksa apakah semua input untuk riwayat medis tidak kosong
    isMedicalHistoryValid.value = geneticRiskText.isNotEmpty &&
        chronicLungDiseaseText.isNotEmpty &&
        obesityText.isNotEmpty &&
        balancedDietText.isNotEmpty;
  }

  // Fungsi untuk memvalidasi riwayat medis tambahan
  void onChangeMainSymptom() {
    String chestPainText = inpChestPain.value.text.trim();
    String coughingOfBloodText = inpCoughingOfBlood.value.text.trim();
    String fatigueText = inpFatigue.value.text.trim();
    String weightLossText = inpWeightLoss.value.text.trim();
    String shortnessOfBreathText = inpShortnessOfBreath.value.text.trim();
    String wheezingText = inpWheezing.value.text.trim();

    // Periksa apakah semua input untuk riwayat medis tambahan tidak kosong
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

    // Periksa apakah semua input untuk riwayat medis tambahan tidak kosong
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

  Future<void> predict() async {
    try {
      var entity = PatientEntity(
        patientId: inpPatient.value.text,
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

      try {
        predictionResult.value = await predictCancerUseCase(entity);
      } catch (e, s) {
        predictionResult.value = 'Failed to predict : $e | $s';
      }
    } catch (e, s) {
      Logger().e('Error during prediction: $e | $s');
    }

    Get.dialog(
      AlertDialog(
        title: const Text('Prediction Result'),
        content: Text(
          'Your prediction result: ${predictionResult.value}',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
