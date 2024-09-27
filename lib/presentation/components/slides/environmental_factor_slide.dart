import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/app_input.dart';
import '../../app_controller.dart';

/// slide 2
class EnvironmentalFactorSlide extends StatelessWidget {
  const EnvironmentalFactorSlide({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Halaman Faktor Lingkungan & Gaya Hidup",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: controller.inpAirPollution.value,
          labelText: "Air Pollution",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        ),
        AppInput(
          controller: controller.inpAlcoholUse.value,
          labelText: "Alcohol use",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        ),
        AppInput(
          controller: controller.inpDustAllergy.value,
          labelText: "Dust Allergy",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        ),
        AppInput(
          controller: controller.inpOccupationalHazards.value,
          labelText: "Occupational Hazards",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        ),
        AppInput(
          controller: controller.inpSmoking.value,
          labelText: "Smoking",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        ),
        AppInput(
          controller: controller.inpPassiveSmoker.value,
          labelText: "Passive Smoker",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeEnvironmental();
          },
        )
      ],
    );
  }
}
