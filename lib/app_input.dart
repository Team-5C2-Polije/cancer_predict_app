import 'package:cancer_predict_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatelessWidget {
  final String labelText; // Label untuk teks di sebelah input
  final double width; // Lebar input field
  final TextEditingController controller; // Controller untuk TextFormField
  final String hintText; // Hint Text untuk input

  const AppInput({
    super.key,
    required this.labelText,
    required this.width,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize:7.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: width.w, // Menggunakan parameter width
            child: TextFormField(
              controller: controller, // Menggunakan parameter controller
              decoration: InputDecoration(
                hintText: hintText, // Menggunakan parameter hintText
                contentPadding:  EdgeInsets.symmetric(
                  vertical: 15.h,
                  horizontal: 5.w,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.black, width: 1),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
