import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'; // untuk menggunakan min()

class PageButton extends StatelessWidget {
  final String label; // Parameter untuk teks pada button
  final VoidCallback onTap; // Parameter untuk aksi ketika button di-tap

  const PageButton({
    super.key,
    required this.label, // Teks button
    required this.onTap, // Aksi ketika di-tap
  });

  @override
  Widget build(BuildContext context) {
    double size = min(45.w, 45.h);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: GestureDetector(
        onTap: onTap, // Menggunakan parameter onTap
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.green,
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
