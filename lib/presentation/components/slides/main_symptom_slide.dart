import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_input.dart';
import '../../app_controller.dart';

/// Slide 4
class MainSymptomSlide extends StatelessWidget {
  const MainSymptomSlide({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Halaman Gejala Utama",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: controller.inpChestPain.value,
          labelText: "Chest Pain",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
        AppInput(
          controller: controller.inpCoughingOfBlood.value,
          labelText: "Coughing of Blood",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
        AppInput(
          controller: controller.inpFatigue.value,
          labelText: "Fatigue",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
        AppInput(
          controller: controller.inpWeightLoss.value,
          labelText: "Weight Loss",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
        AppInput(
          controller: controller.inpShortnessOfBreath.value,
          labelText: "Shortness of Breath",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
        AppInput(
          controller: controller.inpWheezing.value,
          labelText: "Wheezing",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangeMainSymptom();
          },
        ),
      ],
    );
  }
}
