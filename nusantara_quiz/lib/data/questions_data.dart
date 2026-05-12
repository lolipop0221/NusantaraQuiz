import '../models/question.dart';

// ============================================================
// QUESTIONS_DATA.DART — Bank Soal Kuis NusantaraQuiz
// Dibuat oleh: Ana (Content Creator)
// ============================================================

/// Bank soal yang dikelompokkan berdasarkan kategori dan kesulitan.
/// Untuk Minggu 2, kita siapkan sample soal terlebih dahulu.
/// Soal lengkap akan ditambahkan di minggu berikutnya.

final List<Question> bankSoal = [
  // =============================================
  // KATEGORI: BUDAYA — MUDAH
  // =============================================
  const Question(
    pertanyaan: 'Tari Kecak berasal dari provinsi mana?',
    opsi: ['Jawa Tengah', 'Bali', 'Sumatera Barat', 'Sulawesi Selatan'],
    jawabanBenar: 1,
    kategori: 'Budaya',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Wayang kulit merupakan warisan budaya dari pulau?',
    opsi: ['Sumatera', 'Kalimantan', 'Jawa', 'Sulawesi'],
    jawabanBenar: 2,
    kategori: 'Budaya',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Alat musik tradisional Angklung berasal dari daerah?',
    opsi: ['Jawa Barat', 'Jawa Timur', 'Bali', 'NTB'],
    jawabanBenar: 0,
    kategori: 'Budaya',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Batik telah diakui UNESCO sebagai warisan budaya Indonesia pada tahun?',
    opsi: ['2007', '2008', '2009', '2010'],
    jawabanBenar: 2,
    kategori: 'Budaya',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Rumah adat Joglo berasal dari daerah?',
    opsi: ['Sumatera Utara', 'Jawa Tengah', 'Kalimantan', 'Papua'],
    jawabanBenar: 1,
    kategori: 'Budaya',
    kesulitan: 'Mudah',
  ),

  // =============================================
  // KATEGORI: BUDAYA — SEDANG
  // =============================================
  const Question(
    pertanyaan: 'Tari Saman dari Aceh biasanya ditarikan oleh berapa penari?',
    opsi: ['Genap', 'Ganjil', 'Bebas', 'Minimal 2'],
    jawabanBenar: 1,
    kategori: 'Budaya',
    kesulitan: 'Sedang',
  ),
  const Question(
    pertanyaan: 'Reog Ponorogo berasal dari provinsi?',
    opsi: ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'DI Yogyakarta'],
    jawabanBenar: 2,
    kategori: 'Budaya',
    kesulitan: 'Sedang',
  ),

  // =============================================
  // KATEGORI: SEJARAH — MUDAH
  // =============================================
  const Question(
    pertanyaan: 'Indonesia merdeka pada tanggal?',
    opsi: ['17 Agustus 1945', '17 Agustus 1944', '1 Juni 1945', '28 Oktober 1928'],
    jawabanBenar: 0,
    kategori: 'Sejarah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Siapa proklamator kemerdekaan Indonesia?',
    opsi: [
      'Soekarno dan Hatta',
      'Soekarno dan Sjahrir',
      'Hatta dan Sjahrir',
      'Soekarno dan Tan Malaka',
    ],
    jawabanBenar: 0,
    kategori: 'Sejarah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Sumpah Pemuda diperingati setiap tanggal?',
    opsi: ['28 Oktober', '10 November', '1 Juni', '20 Mei'],
    jawabanBenar: 0,
    kategori: 'Sejarah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Candi Borobudur terletak di provinsi?',
    opsi: ['DI Yogyakarta', 'Jawa Tengah', 'Jawa Timur', 'Jawa Barat'],
    jawabanBenar: 1,
    kategori: 'Sejarah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Kerajaan Majapahit berpusat di wilayah yang sekarang disebut?',
    opsi: ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Bali'],
    jawabanBenar: 2,
    kategori: 'Sejarah',
    kesulitan: 'Mudah',
  ),

  // =============================================
  // KATEGORI: SEJARAH — SEDANG
  // =============================================
  const Question(
    pertanyaan: 'Perang Diponegoro terjadi pada tahun?',
    opsi: ['1825-1830', '1830-1835', '1820-1825', '1835-1840'],
    jawabanBenar: 0,
    kategori: 'Sejarah',
    kesulitan: 'Sedang',
  ),
  const Question(
    pertanyaan: 'Siapa pendiri kerajaan Majapahit?',
    opsi: ['Hayam Wuruk', 'Gajah Mada', 'Raden Wijaya', 'Ken Arok'],
    jawabanBenar: 2,
    kategori: 'Sejarah',
    kesulitan: 'Sedang',
  ),

  // =============================================
  // KATEGORI: BAHASA DAERAH — MUDAH
  // =============================================
  const Question(
    pertanyaan: '"Horas" adalah salam khas dari suku?',
    opsi: ['Jawa', 'Batak', 'Sunda', 'Minang'],
    jawabanBenar: 1,
    kategori: 'Bahasa Daerah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Bahasa daerah apa yang menggunakan aksara Lontara?',
    opsi: ['Jawa', 'Sunda', 'Bugis', 'Bali'],
    jawabanBenar: 2,
    kategori: 'Bahasa Daerah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: '"Sampurasun" adalah salam dalam bahasa?',
    opsi: ['Jawa', 'Sunda', 'Madura', 'Betawi'],
    jawabanBenar: 1,
    kategori: 'Bahasa Daerah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Aksara Hanacaraka digunakan dalam bahasa?',
    opsi: ['Sunda', 'Jawa', 'Bali', 'Batak'],
    jawabanBenar: 1,
    kategori: 'Bahasa Daerah',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: '"Matur nuwun" artinya terima kasih dalam bahasa?',
    opsi: ['Sunda', 'Jawa', 'Madura', 'Betawi'],
    jawabanBenar: 1,
    kategori: 'Bahasa Daerah',
    kesulitan: 'Mudah',
  ),

  // =============================================
  // KATEGORI: PENGETAHUAN UMUM — MUDAH
  // =============================================
  const Question(
    pertanyaan: 'Berapa jumlah provinsi di Indonesia saat ini?',
    opsi: ['34', '36', '38', '37'],
    jawabanBenar: 2,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Pulau terbesar di Indonesia adalah?',
    opsi: ['Sumatera', 'Jawa', 'Kalimantan', 'Papua'],
    jawabanBenar: 2,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Gunung tertinggi di Indonesia adalah?',
    opsi: ['Gunung Semeru', 'Gunung Kerinci', 'Puncak Jaya', 'Gunung Rinjani'],
    jawabanBenar: 2,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Ibu kota baru Indonesia bernama?',
    opsi: ['Balikpapan', 'Samarinda', 'Nusantara', 'Palangkaraya'],
    jawabanBenar: 2,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Mudah',
  ),
  const Question(
    pertanyaan: 'Danau terbesar di Indonesia adalah?',
    opsi: ['Danau Toba', 'Danau Sentani', 'Danau Maninjau', 'Danau Poso'],
    jawabanBenar: 0,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Mudah',
  ),

  // =============================================
  // KATEGORI: PENGETAHUAN UMUM — SEDANG
  // =============================================
  const Question(
    pertanyaan: 'Flora nasional Indonesia (puspa bangsa) adalah?',
    opsi: ['Anggrek Bulan', 'Melati', 'Rafflesia', 'Kenanga'],
    jawabanBenar: 1,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Sedang',
  ),
  const Question(
    pertanyaan: 'Komodo hanya ditemukan secara alami di pulau?',
    opsi: ['Jawa', 'Sumatera', 'Flores & sekitarnya', 'Kalimantan'],
    jawabanBenar: 2,
    kategori: 'Pengetahuan Umum',
    kesulitan: 'Sedang',
  ),
];

/// Fungsi untuk mendapatkan soal berdasarkan kategori dan kesulitan
List<Question> getSoal({required String kategori, required String kesulitan}) {
  return bankSoal
      .where((q) => q.kategori == kategori && q.kesulitan == kesulitan)
      .toList();
}

/// Fungsi untuk mendapatkan semua soal dari satu kategori
List<Question> getSoalByKategori(String kategori) {
  return bankSoal.where((q) => q.kategori == kategori).toList();
}
