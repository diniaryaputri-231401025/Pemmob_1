// lib/pages/quiz_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_state.dart';
import '../utils/app_styles.dart';
import '../widgets/quiz/answer_button.dart';
import 'result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? _selectedAnswer;
  bool _isAnswerLocked = false;

  void _handleAnswer(QuizState state, String answer) {
    if (_isAnswerLocked) return;

    setState(() {
      _selectedAnswer = answer;
      _isAnswerLocked = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      state.answerQuestion(answer);

      setState(() {
        _selectedAnswer = null;
        _isAnswerLocked = false;
      });
    });
  }

  // Bonus Poin 2: Menggunakan LayoutBuilder untuk Responsiveness
  Widget _buildQuizContent(BuildContext context, QuizState state) {
    if (state.isQuizFinished) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ResultPage()),
        );
      });
      return const Center(child: CircularProgressIndicator());
    }

    final currentQ = state.currentQuestion;
    final questionNumber = state.currentQuestionIndex + 1;
    final progress = questionNumber / state.totalQuestions;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Bonus Poin 2: Logic Two-Column Layout (Tablet/Web)
        bool useTwoColumnLayout = constraints.maxWidth > 600;
        final paddingValue = MediaQuery.of(context).size.width * 0.05;

        // Konten Pertanyaan
        Widget questionContent = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: secondaryColor.withOpacity(0.3),
              color: primaryColor,
            ),
            const SizedBox(height: 30),

            // Teks Pertanyaan
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pertanyaan $questionNumber dari ${state.totalQuestions}',
                      style: getTextStyle(context, scale: 0.9, weight: FontWeight.w600).copyWith(color: primaryColor),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      currentQ.text,
                      style: getTextStyle(context, scale: useTwoColumnLayout ? 1.4 : 1.3, weight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );

        // Tombol Jawaban
        List<Widget> answerButtons = currentQ.options.map((option) {
          final isCorrect = option == currentQ.correctAnswer;
          final isSelected = option == _selectedAnswer;

          Color bgColor;
          if (_selectedAnswer == null) {
            bgColor = primaryColor;
          } else if (isSelected) {
            bgColor = isCorrect ? Colors.green.shade600 : Colors.red.shade600;
          } else if (isCorrect) {
            bgColor = Colors.green.shade300;
          } else {
            bgColor = primaryColor.withOpacity(0.6);
          }

          return AnswerButton(
            text: option,
            backgroundColor: bgColor,
            onPressed: _isAnswerLocked ? null : () => _handleAnswer(state, option),
          );
        }).toList();

        // Implementasi Tata Letak Responsif
        if (useTwoColumnLayout) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: questionContent),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: answerButtons,
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              questionContent,
              const SizedBox(height: 30),
              ...answerButtons,
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${state.username}\'s Quiz',
              style: getTextStyle(context, scale: 1.0, weight: FontWeight.bold),
            ),
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline),
                    const SizedBox(width: 5),
                    Text(
                      'Skor: ${state.score}',
                      style: getTextStyle(context, scale: 1.0, weight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            child: _buildQuizContent(context, state),
          ),
        );
      },
    );
  }
}