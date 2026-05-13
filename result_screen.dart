import 'package:flutter/material.dart';
import '../utils/constants.dart';

// ============================================================
// RESULT_SCREEN.DART — Halaman Hasil Kuis (Layout Only - Minggu 2)
// Dibuat oleh: Azam Murahman (Android Developer)
// ============================================================

/// Untuk Minggu 2: Menampilkan layout halaman hasil.
/// Data skor real akan dihubungkan di Minggu 3.
class ResultScreen extends StatelessWidget {
  final String kategori;
  final String kesulitan;
  final int skorBenar;
  final int totalSoal;

  const ResultScreen({
    super.key,
    this.kategori = 'Budaya',
    this.kesulitan = 'Mudah',
    this.skorBenar = 4,
    this.totalSoal = 5,
  });

  @override
  Widget build(BuildContext context) {
    final persentase = (skorBenar / totalSoal * 100).round();
    final isPassed = persentase >= 60;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.xl),

                // Emoji berdasarkan hasil
                Icon(
                  isPassed ? Icons.emoji_events_rounded : Icons.sentiment_dissatisfied_rounded,
                  size: 100,
                  color: isPassed ? AppColors.accent : AppColors.wrong,
                ),

                const SizedBox(height: AppSpacing.md),

                Text(
                  isPassed ? 'Hebat! 🎉' : 'Coba Lagi! 💪',
                  style: AppTextStyles.heading.copyWith(fontSize: 28),
                ),

                const SizedBox(height: AppSpacing.sm),

                Text(
                  isPassed ? 'Kamu menguasai materi ini!' : 'Jangan menyerah, terus belajar!',
                  style: AppTextStyles.subheading,
                ),

                const SizedBox(height: AppSpacing.xl),

                // Kartu skor
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: AppDecorations.card,
                  child: Column(
                    children: [
                      Text('$kategori — $kesulitan', style: AppTextStyles.caption.copyWith(color: AppColors.accent)),
                      const SizedBox(height: AppSpacing.md),
                      Text('$persentase%', style: AppTextStyles.score),
                      const SizedBox(height: AppSpacing.sm),
                      Text('$skorBenar dari $totalSoal soal benar', style: AppTextStyles.body),
                      const SizedBox(height: AppSpacing.md),

                      // Bintang rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (i) {
                          final starThreshold = (i + 1) * 20;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Icon(
                              Icons.star_rounded, size: 36,
                              color: persentase >= starThreshold ? AppColors.accent : AppColors.textHint,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Tombol aksi
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                    icon: const Icon(Icons.home_rounded, color: Colors.white),
                    label: const Text('Kembali ke Menu', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
