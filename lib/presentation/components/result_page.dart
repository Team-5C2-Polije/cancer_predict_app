import 'package:cancer_predict_app/presentation/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// halaman hasil prediksi
class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {

    final AppController controller = Get.find();

    return Scaffold(
      body: Obx(() {
        return Center(
          child: Text(
            "${controller.predictionResult}",
            style: GoogleFonts.nunito(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
