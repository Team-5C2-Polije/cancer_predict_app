import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'; // untuk menggunakan min()

class PageButton extends StatelessWidget {
  final String label; // Parameter untuk teks pada button
  final VoidCallback onTap; // Parameter untuk aksi ketika button di-tap
  final bool isValid;
  final bool isActive;

  const PageButton({
    super.key,
    required this.label, // Teks button
    required this.onTap, // Aksi ketika di-tap
    this.isValid = false,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    double size = min(45.w, 45.h);
    double sizeActive =  min(55.w, 55.h);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: GestureDetector(
        onTap: onTap, // Menggunakan parameter onTap
        child: Container(
          width: isActive ? sizeActive : size,
          height: isActive ? sizeActive : size,
          decoration: BoxDecoration(
            color: isValid ? Colors.green : Colors.red,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(
              label, // Menggunakan parameter label
              style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
