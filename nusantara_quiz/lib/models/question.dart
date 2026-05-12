// ============================================================
// QUESTION.DART — Model Data Soal Kuis
// Dibuat oleh: Ana (Content Creator)
// ============================================================

/// Model untuk satu soal kuis
/// Setiap soal punya pertanyaan, 4 pilihan jawaban,
/// indeks jawaban benar, kategori, dan tingkat kesulitan
class Question {
  final String pertanyaan;
  final List<String> opsi; // 4 pilihan jawaban
  final int jawabanBenar; // index 0-3
  final String kategori; // Budaya, Sejarah, Bahasa, Umum
  final String kesulitan; // Mudah, Sedang, Susah

  const Question({
    required this.pertanyaan,
    required this.opsi,
    required this.jawabanBenar,
    required this.kategori,
    required this.kesulitan,
  });
}

/// Daftar kategori yang tersedia
class Kategori {
  static const String budaya = 'Budaya';
  static const String sejarah = 'Sejarah';
  static const String bahasa = 'Bahasa Daerah';
  static const String umum = 'Pengetahuan Umum';

  static const List<String> semua = [budaya, sejarah, bahasa, umum];
}

/// Daftar tingkat kesulitan
class Kesulitan {
  static const String mudah = 'Mudah';
  static const String sedang = 'Sedang';
  static const String susah = 'Susah';

  static const List<String> semua = [mudah, sedang, susah];
}
