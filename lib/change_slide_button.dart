import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math'; // untuk menggunakan min()

class ChangeSlideButton extends StatelessWidget {
  final VoidCallback onTap; // Aksi ketika button di-tap
  final IconData icon; // Ikon yang akan ditampilkan pada button
  final double size; // Ukuran button (diameter lingkaran)

  const ChangeSlideButton({
    super.key,
    required this.onTap,
    required this.icon, // Ikon sebagai inputan
    this.size = 50, // Ukuran default button adalah 50
  });

  @override
  Widget build(BuildContext context) {
    // Menggunakan ukuran minimum dari width dan height agar tetap lingkaran di layar
    double circleSize = min(size.w, size.h);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: GestureDetector(
        onTap: onTap, // Menggunakan parameter onTap
        child: Container(
          width: circleSize, // Lebar button
          height: circleSize, // Tinggi button, sama seperti lebar untuk menjaga bentuk lingkaran
          decoration: BoxDecoration(
            color: Colors.purple,
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            shape: BoxShape.circle, // Bentuk lingkaran
          ),
          child: Center(
            child: Icon(
              icon, // Ikon yang dapat diubah
              size: circleSize * 0.5, // Ukuran ikon 50% dari ukuran lingkaran
            ),
          ),
        ),
      ),
    );
  }
}
