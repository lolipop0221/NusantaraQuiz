import 'package:flutter/material.dart';

void main() {
  runApp(const NusantaraQuizApp());
}

class NusantaraQuizApp extends StatelessWidget {
  const NusantaraQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi di background (saat di-minimize)
      title: 'Nusantara Quiz',
      
      // Tema aplikasi (kita ubah warnanya jadi merah tua/elegan)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red.shade900, 
          brightness: Brightness.dark, // Kita buat mode gelap agar keren!
        ),
      ),
      
      // Halaman pertama yang muncul
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold adalah "Kanvas Kosong" untuk satu halaman HP
    return Scaffold(
      
      // AppBar adalah baris judul di paling atas aplikasi
      appBar: AppBar(
        title: const Text('Nusantara Quiz'),
        centerTitle: true, // Judulnya di tengah
      ),
      
      // Body adalah isi utama halamannya (di tengah)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Selamat Datang di NusantaraQuiz!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Jarak spasi
            Text('Mari Bermain dan Belajar Budaya Indonesia'),
          ],
        ),
      ),
      
    );
  }
}
