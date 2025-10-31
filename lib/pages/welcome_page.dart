// lib/pages/welcome_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../widgets/reusable/custom_button.dart';
import '../utils/app_styles.dart';
import 'quiz_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final nameController = TextEditingController();
    final theme = Theme.of(context);

    // Kriteria 7: Watch QuizState untuk icon theme toggle
    final quizState = context.watch<QuizState>();
    final onPrimaryColor = theme.colorScheme.onPrimary;
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App', style: getTextStyle(context, scale: 1.1)),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          // Toggle Theme dengan Icon
          IconButton(
            icon: Icon(
              quizState.themeMode == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: primaryColor,
            ),
            onPressed: () {
              quizState.toggleTheme();
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        // Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor.withAlpha(204), theme.scaffoldBackgroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(screenWidth * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/speech-bubble.png', // GUNAKAN NAMA FILE SEDERHANA
              width: screenWidth * 0.8,
              height: screenWidth * 0.5,
              fit: BoxFit.contain,
            )
            ),
                const SizedBox(height: 30),

                // Judul
                Text(
                  'Siap Uji Pengetahuanmu?',
                  style: getTextStyle(context, scale: 2.0, weight: FontWeight.w900).copyWith(
                      color: onPrimaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
                // ... (teks deskripsi & Card Input)
                const SizedBox(height: 50),

                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Nama Pengguna',
                            filled: true,
                            fillColor: theme.scaffoldBackgroundColor.withOpacity(0.9),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.person, color: primaryColor),
                          ),
                          style: getTextStyle(context, scale: 1.0),
                        ),
                        const SizedBox(height: 30),

                        CustomButton(
                          text: 'Mulai Kuis Sekarang',
                          onPressed: () {
                            final username = nameController.text.trim();
                            if (username.isNotEmpty) {
                              context.read<QuizState>().setUsername(username);
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) => const QuizPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Nama tidak boleh kosong!')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}