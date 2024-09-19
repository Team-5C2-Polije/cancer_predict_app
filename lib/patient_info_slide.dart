import 'package:cancer_predict_app/app_input.dart';
import 'package:cancer_predict_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Slide 1
class PatientInfoSlide extends StatelessWidget {
  const PatientInfoSlide({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController input = TextEditingController();
    final TextEditingController input2 = TextEditingController();
    final TextEditingController input3 = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Halaman Data Pasien",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 20.h),
        AppInput(
          controller: input,
          labelText: "ID Pasien",
          hintText: "",
          width: 60,
        ),
        AppInput(
          controller: input2,
          labelText: "Age",
          hintText: "",
          width: 30,
        ),
        AppInput(
          controller: input3,
          labelText: "Inputan 3",
          hintText: "",
          width: 30,
        )
      ],
    );
  }
}
