import 'package:cancer_predict_app/additional_symptom_slide.dart';
import 'package:cancer_predict_app/change_slide_button.dart';
import 'package:cancer_predict_app/environmental_factor_slide.dart';
import 'package:cancer_predict_app/main_symptom_slide.dart';
import 'package:cancer_predict_app/medical_history_slide.dart';
import 'package:cancer_predict_app/page_button.dart';
import 'package:cancer_predict_app/patient_info_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWindowPage extends StatefulWidget {
  const MainWindowPage({super.key});

  @override
  State<MainWindowPage> createState() => _MainWindowPageState();
}

class _MainWindowPageState extends State<MainWindowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xFF7E869B),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChangeSlideButton(
                    onTap: () {},
                    icon: Icons.arrow_back,
                  ),
                  PageButton(
                    label: "1", // Teks yang ingin ditampilkan
                    onTap: () {
                      // Aksi ketika button di-tap
                      print("Button 1 clicked");
                    },
                  ),
                  PageButton(
                    label: "2", // Teks yang ingin ditampilkan
                    onTap: () {
                      // Aksi ketika button di-tap
                      print("Button 1 clicked");
                    },
                  ),
                  PageButton(
                    label: "3", // Teks yang ingin ditampilkan
                    onTap: () {
                      // Aksi ketika button di-tap
                      print("Button 1 clicked");
                    },
                  ),
                  PageButton(
                    label: "4", // Teks yang ingin ditampilkan
                    onTap: () {
                      // Aksi ketika button di-tap
                      print("Button 1 clicked");
                    },
                  ),
                  PageButton(
                    label: "5", // Teks yang ingin ditampilkan
                    onTap: () {
                      // Aksi ketika button di-tap
                      print("Button 1 clicked");
                    },
                  ),
                  ChangeSlideButton(
                    onTap: () {},
                    icon: Icons.arrow_forward,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Stack(
                children: [
                  PatientInfoSlide()
                  // EnvironmentalFactorSlide()
                  // MedicalHistorySlide()
                  // MainSymptomSlide()
                  // AdditionalSymptomSlide()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
