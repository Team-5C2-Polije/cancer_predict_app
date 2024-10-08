import 'package:cancer_predict_app/presentation/app_controller.dart';
import 'package:cancer_predict_app/presentation/components/change_slide_button.dart';
import 'package:cancer_predict_app/presentation/components/page_button.dart';
import 'package:cancer_predict_app/presentation/components/slides/patient_info_slide.dart';
import 'package:cancer_predict_app/presentation/components/slides/environmental_factor_slide.dart';
import 'package:cancer_predict_app/presentation/components/slides/medical_history_slide.dart';
import 'package:cancer_predict_app/presentation/components/slides/main_symptom_slide.dart';
import 'package:cancer_predict_app/presentation/components/slides/additional_symptom_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainWindowPage extends StatefulWidget {
  const MainWindowPage({super.key});

  static String routeName = '/main_window';

  @override
  State<MainWindowPage> createState() => _MainWindowPageState();
}

class _MainWindowPageState extends State<MainWindowPage> {
  final AppController controller = Get.find();

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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xFF7E869B),
              ),
              child: Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChangeSlideButton(
                      onTap: () {
                        if (controller.slidePos.value > 1) {
                          controller.slidePos.value--;
                        }
                      },
                      icon: Icons.arrow_back,
                    ),
                    PageButton(
                      label: "1",
                      isValid: controller.isInfoPatientValid.value,
                      isActive: controller.slidePos.value == 1,
                      onTap: () {
                        controller.slidePos.value = 1;
                      },
                    ),
                    PageButton(
                      label: "2",
                      isValid: controller.isEnviromentalValid.value,
                      isActive: controller.slidePos.value == 2,
                      onTap: () {
                        controller.slidePos.value = 2;
                      },
                    ),
                    PageButton(
                      label: "3",
                      isValid: controller.isMedicalHistoryValid.value,
                      isActive: controller.slidePos.value == 3,
                      onTap: () {
                        controller.slidePos.value = 3;
                      },
                    ),
                    PageButton(
                      label: "4",
                      isValid: controller.isMainSymptomValid.value,
                      isActive: controller.slidePos.value == 4,
                      onTap: () {
                        controller.slidePos.value = 4;
                      },
                    ),
                    PageButton(
                      label: "5",
                      isValid: controller.isAdditionalSymptom.value,
                      isActive: controller.slidePos.value == 5,
                      onTap: () {
                        controller.slidePos.value = 5;
                      },
                    ),
                    ChangeSlideButton(
                      onTap: () {
                        if (controller.slidePos.value < 5) {
                          controller.slidePos.value++;
                        }
                      },
                      icon: Icons.arrow_forward,
                    ),
                  ],
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Stack(
                children: [
                  Obx(() {
                    switch (controller.slidePos.value) {
                      case 1:
                        return const PatientInfoSlide();
                      case 2:
                        return const EnvironmentalFactorSlide();
                      case 3:
                        return const MedicalHistorySlide();
                      case 4:
                        return const MainSymptomSlide();
                      case 5:
                        return const AdditionalSymptomSlide();
                      default:
                        return Container();
                    }
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
