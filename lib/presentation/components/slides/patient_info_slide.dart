import 'package:cancer_predict_app/core/widgets/app_input.dart';
import 'package:cancer_predict_app/main.dart';
import 'package:cancer_predict_app/presentation/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Slide 1
class PatientInfoSlide extends StatelessWidget {
  const PatientInfoSlide({super.key});

  @override
  Widget build(BuildContext context) {
    AppController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Halaman Data Pasien",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: controller.inpPatient.value,
          labelText: "ID Pasien",
          hintText: "",
          width: 60,
          isNumberOnly: false,
          isOnlyOne: false,
          onChange: (s){
            controller.onChangePatient();
          },
        ),
        AppInput(
          controller: controller.inpAge.value,
          labelText: "Age",
          hintText: "",
          isOnlyOne: false,
          width: 30,
          onChange: (s){
            controller.onChangePatient();
          },
        ),
        AppInput(
          controller: controller.inpGender.value,
          labelText: "Gender",
          hintText: "",
          width: 30,
          onChange: (s){
            controller.onChangePatient();
          },
        )
      ],
    );
  }
}
