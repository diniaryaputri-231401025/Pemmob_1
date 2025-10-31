// lib/pages/result_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../widgets/reusable/custom_button.dart';
import '../utils/app_styles.dart';
import 'welcome_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<QuizState>();
    final percentage = (state.score / state.totalQuestions) * 100;
    final primaryColor = Theme.of(context).colorScheme.primary;

    // Kriteria 4: Menggunakan aset gambar sesuai hasil
    final String assetPath = percentage >= 70
        ? 'assets/images/medal.png'
        : 'assets/images/fail.png';

    final scoreStyle = getTextStyle(context, scale: 2.5, weight: FontWeight.w900).copyWith(
      color: percentage >= 70 ? Colors.green.shade700 : Colors.red.shade700,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Menggunakan Gambar Aset Kustom
              Image.asset(
                assetPath,
                height: 150,
              ),

              const SizedBox(height: 30),

              Text(
                'Selamat, ${state.username}!',
                style: getTextStyle(context, scale: 1.8, weight: FontWeight.bold).copyWith(color: primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Text(
                'Skor Akhir Anda:',
                style: getTextStyle(context, scale: 1.3),
              ),
              const SizedBox(height: 10),

              Text(
                '${state.score} / ${state.totalQuestions}',
                style: scoreStyle,
              ),
              Text(
                '(${percentage.toStringAsFixed(1)}%)',
                style: getTextStyle(context, scale: 1.1),
              ),

              const SizedBox(height: 50),

              CustomButton(
                text: 'Mulai Ulang Kuis',
                onPressed: () {
                  state.resetQuiz();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (ctx) => const WelcomePage()),
                        (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}