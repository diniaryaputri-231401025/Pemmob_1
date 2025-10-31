// lib/providers/quiz_state.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // Wajib diimport untuk ThemeMode
import '../models/question.dart';
import '../data/questions.dart';

class QuizState with ChangeNotifier {
  // State Kuis
  String _username = '';
  int _score = 0;
  int _currentQuestionIndex = 0;
  final List<Question> _questions = getDummyQuestions();

  // State Tema (Bonus Poin 1)
  ThemeMode _themeMode = ThemeMode.system;

  // --- GETTER ---
  String get username => _username;
  int get score => _score;
  int get currentQuestionIndex => _currentQuestionIndex;
  Question get currentQuestion => _questions[_currentQuestionIndex];
  int get totalQuestions => _questions.length;
  bool get isQuizFinished => _currentQuestionIndex >= _questions.length;
  ThemeMode get themeMode => _themeMode;

  // --- ACTIONS ---

  // Toggle Theme (Bonus Poin 1)
  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.light)
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }

  void answerQuestion(String selectedAnswer) {
    if (isQuizFinished) return;

    if (selectedAnswer == currentQuestion.correctAnswer) {
      _score++;
    }

    _currentQuestionIndex++;

    notifyListeners();
  }

  void resetQuiz() {
    _score = 0;
    _currentQuestionIndex = 0;
    _username = '';
    // Pertahankan pengaturan tema saat reset
    notifyListeners();
  }
}