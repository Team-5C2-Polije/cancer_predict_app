import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppInput extends StatelessWidget {
  final String labelText; // Label untuk teks di sebelah input
  final double width; // Lebar input field
  final TextEditingController controller; // Controller untuk TextFormField
  final String hintText; // Hint Text untuk input
  final bool isNumberOnly; // Menentukan apakah input hanya angka
  final bool? isOnlyOne;
  final ValueChanged<String>? onChange; // Callback untuk perubahan teks

  const AppInput({
    super.key,
    required this.labelText,
    required this.width,
    required this.controller,
    required this.hintText,
    this.isOnlyOne,
    this.isNumberOnly = true,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            labelText,
            style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: width.w, // Menggunakan parameter width
            child: TextFormField(
              controller: controller,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              keyboardType: isNumberOnly ? TextInputType.number : null,
              inputFormatters: [
                if (isNumberOnly) FilteringTextInputFormatter.digitsOnly,
                if (isOnlyOne != false) LengthLimitingTextInputFormatter(1),
              ],
              maxLength: (isOnlyOne != false) ? 1 : null, // Sesuaikan maxLength berdasarkan isOnlyOne
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.symmetric(
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
                counterText: "", // Menyembunyikan penghitung karakter
              ),
              onChanged: onChange, // Tambahkan onChanged untuk menangani perubahan teks
            ),
          ),
        ],
      ),
    );
  }
}
