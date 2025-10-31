// lib/data/questions.dart
import '../models/question.dart';

List<Question> getDummyQuestions() {
  // Kriteria 8: Data Lokal/Dummy
  return [
    Question(
      text: 'Bahasa pemrograman yang digunakan oleh Flutter?',
      options: ['Java', 'Kotlin', 'Dart', 'Python'],
      correctAnswer: 'Dart',
    ),
    Question(
      text: 'Apa nama widget yang tidak dapat berubah?',
      options: ['StatefulWidget', 'Provider', 'StatelessWidget', 'Container'],
      correctAnswer: 'StatelessWidget',
    ),
    Question(
      text: 'Bahasa pemrograman yang digunakan oleh Flutter?',
      options: ['Java', 'Kotlin', 'Dart', 'Python'],
      correctAnswer: 'Dart',
    ),
    Question(
      text: 'Apa nama widget yang tidak dapat berubah?',
      options: ['StatefulWidget', 'Provider', 'StatelessWidget', 'Container'],
      correctAnswer: 'StatelessWidget',
    ),
    Question(
      text: 'Widget Flutter yang digunakan untuk mengatur tata letak anak-anak secara vertikal disebut?',
      options: ['Row', 'Stack', 'Column', 'Wrap'],
      correctAnswer: 'Column',
    ),
    Question(
      text: 'Apa yang harus digunakan untuk mengelola data yang berubah antar-halaman (State Management)?',
      options: ['BuildContext', 'StatelessWidget', 'Provider', 'Scaffold'],
      correctAnswer: 'Provider',
    ),
    Question(
      text: 'Di mana deklarasi aset seperti font dan gambar harus ditempatkan?',
      options: ['android/app/src', 'lib/assets', 'pubspec.yaml', 'main.dart'],
      correctAnswer: 'pubspec.yaml',
    ),
    Question(
      text: 'Metode mana yang dipanggil pertama kali saat StatefulWidget dibuat?',
      options: ['build()', 'dispose()', 'initState()', 'createState()'],
      correctAnswer: 'createState()',
    ),
    Question(
      text: 'Apa singkatan dari SDK dalam konteks pengembangan software?',
      options: ['Software Design Kit', 'System Development Kernel', 'Software Development Kit', 'Source Data Key'],
      correctAnswer: 'Software Development Kit',
    ),
    // ... tambahkan minimal 3-5 pertanyaan lagi di sini
  ];
}