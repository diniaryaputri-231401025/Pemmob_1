// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/quiz_state.dart';
import 'pages/welcome_page.dart';
import 'utils/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QuizState(),
      child: const QuizApp(),
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Membaca state tema dari Provider
    return Consumer<QuizState>(
        builder: (context, state, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Kuis Pilihan Ganda',

            // Bonus Poin 1: Implementasi Dual-Theme
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode, // Menggunakan state dari Provider

            home: const WelcomePage(),
          );
        }
    );
  }
}