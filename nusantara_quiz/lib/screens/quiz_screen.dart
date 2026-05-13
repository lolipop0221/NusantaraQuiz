import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../data/questions_data.dart';

// ============================================================
// QUIZ_SCREEN.DART — Halaman Kuis (Layout Only - Minggu 2)
// Dibuat oleh: Abdus Saleh (Android Developer)
// ============================================================

/// Untuk Minggu 2: Hanya menampilkan LAYOUT kuis.
/// Logika timer, poin, dan navigasi soal akan ditambahkan di Minggu 3.
class QuizScreen extends StatefulWidget {
  final String kategori;
  final String kesulitan;
  const QuizScreen({super.key, required this.kategori, required this.kesulitan});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int soalSekarang = 0;
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    // Ambil soal berdasarkan kategori & kesulitan
    final soalList = getSoal(kategori: widget.kategori, kesulitan: widget.kesulitan);

    // Jika tidak ada soal, tampilkan pesan
    if (soalList.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.construction_rounded, size: 80, color: AppColors.accent),
                const SizedBox(height: AppSpacing.md),
                const Text('Soal Belum Tersedia', style: AppTextStyles.heading),
                const SizedBox(height: AppSpacing.sm),
                Text('Soal ${widget.kategori} - ${widget.kesulitan}\nakan segera ditambahkan!',
                  style: AppTextStyles.subheading, textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.xl),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14)),
                  child: const Text('Kembali', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final soal = soalList[soalSekarang];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              children: [
                // Top bar: Back, Progress, Timer placeholder
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => _showExitDialog(context),
                      icon: const Icon(Icons.close_rounded, color: AppColors.textPrimary),
                    ),
                    // Progress
                    Text('${soalSekarang + 1} / ${soalList.length}', style: AppTextStyles.subheading),
                    // Timer placeholder (belum aktif di Minggu 2)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.card, borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.accent.withValues(alpha: 0.5)),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.timer_rounded, color: AppColors.accent, size: 18),
                          SizedBox(width: 4),
                          Text('30', style: TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),

                // Progress bar
                const SizedBox(height: AppSpacing.md),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (soalSekarang + 1) / soalList.length,
                    backgroundColor: AppColors.card,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
                    minHeight: 8,
                  ),
                ),

                const SizedBox(height: AppSpacing.xl),

                // Kartu soal
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: AppDecorations.card,
                  child: Column(
                    children: [
                      Text('Soal ${soalSekarang + 1}', style: AppTextStyles.caption.copyWith(color: AppColors.accent)),
                      const SizedBox(height: AppSpacing.md),
                      Text(soal.pertanyaan, style: AppTextStyles.question, textAlign: TextAlign.center),
                    ],
                  ),
                ),

                const SizedBox(height: AppSpacing.lg),

                // Opsi jawaban
                Expanded(
                  child: ListView.builder(
                    itemCount: soal.opsi.length,
                    itemBuilder: (context, index) {
                      final isSelected = selectedOption == index;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: GestureDetector(
                          onTap: () {
                            setState(() { selectedOption = index; });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary.withValues(alpha: 0.3) : AppColors.card,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected ? AppColors.primary : AppColors.cardLight,
                                width: isSelected ? 2 : 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36, height: 36,
                                  decoration: BoxDecoration(
                                    color: isSelected ? AppColors.primary : AppColors.cardLight,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      String.fromCharCode(65 + index), // A, B, C, D
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.md),
                                Expanded(child: Text(soal.opsi[index], style: AppTextStyles.option)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Tombol Next
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedOption != null ? () {
                      if (soalSekarang < soalList.length - 1) {
                        setState(() { soalSekarang++; selectedOption = null; });
                      } else {
                        // Kuis selesai — navigasi ke result (Minggu 3)
                        Navigator.popUntil(context, (route) => route.isFirst);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Kuis selesai! Halaman hasil akan hadir di update berikutnya.')),
                        );
                      }
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.card,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      soalSekarang < soalList.length - 1 ? 'Soal Berikutnya' : 'Selesai',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Keluar dari Kuis?', style: TextStyle(color: AppColors.textPrimary)),
        content: const Text('Progres kamu akan hilang.', style: TextStyle(color: AppColors.textSecondary)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal', style: TextStyle(color: AppColors.textSecondary))),
          TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); },
            child: const Text('Keluar', style: TextStyle(color: AppColors.wrong))),
        ],
      ),
    );
  }
}
