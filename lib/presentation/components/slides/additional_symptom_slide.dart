import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_input.dart';
import '../../app_controller.dart';

/// slide 5
class AdditionalSymptomSlide extends StatelessWidget {
  const AdditionalSymptomSlide({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Halaman Gejala Tambahan",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: controller.inpSwallowingDifficulty.value,
          labelText: "Swallowing Difficulty",
          hintText: "",
          width: 30,
          onChange: (s) {
            controller.onChangeAdditionalSymptom();
          },
        ),
        AppInput(
          controller: controller.inpClubbingOfFingerNails.value,
          labelText: "Clubbing of Finger Nails",
          hintText: "",
          width: 30,
          onChange: (s) {
            controller.onChangeAdditionalSymptom();
          },
        ),
        AppInput(
          controller: controller.inpFrequentCold.value,
          labelText: "Frequent Cold",
          hintText: "",
          width: 30,
          onChange: (s) {
            controller.onChangeAdditionalSymptom();
          },
        ),
        AppInput(
          controller: controller.inpDryCough.value,
          labelText: "Dry Cough",
          hintText: "",
          width: 30,
          onChange: (s) {
            controller.onChangeAdditionalSymptom();
          },
        ),
        AppInput(
          controller: controller.inpSnoring.value,
          labelText: "Snoring",
          hintText: "",
          width: 30,
          onChange: (s) {
            controller.onChangeAdditionalSymptom();
          },
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          ElevatedButton(
            onPressed: () {
              controller.clearAllData();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            child: const Text(
              "BERSIHKAN DATA",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () async {
              await controller.predict();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            child: const Text(
              "PREDICT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
        ],)
      ],
    );
  }
}
