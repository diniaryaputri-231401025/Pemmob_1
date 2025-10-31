// lib/utils/app_styles.dart
import 'package:flutter/material.dart';

// Fungsi untuk mendapatkan ukuran teks relatif terhadap tinggi/lebar layar
// Kriteria 6: Ukuran dinamis
TextStyle getTextStyle(BuildContext context, {double scale = 1.0, FontWeight weight = FontWeight.normal}) {
  double screenHeight = MediaQuery.of(context).size.height;
  // Ukuran font dasar disesuaikan dengan tinggi layar (misalnya 2.2% dari tinggi)
  double baseFontSize = screenHeight * 0.022;

  return TextStyle(
    fontFamily: 'Poppins', // Kriteria 5: Font Kustom
    fontSize: baseFontSize * scale,
    fontWeight: weight,
  );
}