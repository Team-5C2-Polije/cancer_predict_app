import 'package:cancer_predict_app/domain/entity/cancer_entity.dart';
import 'package:cancer_predict_app/presentation/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultDialog {
  final PatientEntity data;
  final AppController controller;

  ResultDialog({
    required this.data,
    required this.controller,
  });

  void showResultDialog() {
    Get.dialog(
      Center(
        child: IntrinsicHeight(
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Result",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontSize: 35,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Patient ID : ${data.patientId}",
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Level Predict : ${data.level}",
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Accuracy : ${((data.accuracy ?? 0) * 100).toInt()}%",
                    style: GoogleFonts.nunito(
                      fontSize: 28,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.savePatientDataToExcel();
                          Get.back();
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        child: const Text(
                          "Save to Excel",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
