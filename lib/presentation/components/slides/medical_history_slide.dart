import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_input.dart';
import '../../app_controller.dart';

/// Slide 3
class MedicalHistorySlide extends StatelessWidget {
  const MedicalHistorySlide({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Halaman Riwayat Kesehatan & Risiko Genetik",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: controller.inpGeneticRisk.value,
          labelText: "Genetic Risk",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMedicalHistory();
          },
        ),
        AppInput(
          controller: controller.inpChronicLungDisease.value,
          labelText: "Chronic Lung Disease",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMedicalHistory();
          },
        ),
        AppInput(
          controller: controller.inpObesity.value,
          labelText: "Obesity",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMedicalHistory();
          },
        ),
        AppInput(
          controller: controller.inpBalancedDiet.value,
          labelText: "Balanced Diet",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMedicalHistory();
          },
        ),
      ],
    );
  }
}
