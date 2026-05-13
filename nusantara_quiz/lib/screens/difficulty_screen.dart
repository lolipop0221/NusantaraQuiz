import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'quiz_screen.dart';

// ============================================================
// DIFFICULTY_SCREEN.DART — Halaman Pilih Tingkat Kesulitan
// Dibuat oleh: Abdus Saleh (Android Developer)
// ============================================================

class DifficultyScreen extends StatelessWidget {
  final String kategori;
  const DifficultyScreen({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    final difficulties = [
      {'nama': 'Mudah', 'icon': Icons.sentiment_satisfied_rounded, 'color': AppColors.correct, 'desc': 'Soal-soal dasar untuk pemanasan', 'stars': 1},
      {'nama': 'Sedang', 'icon': Icons.sentiment_neutral_rounded, 'color': AppColors.accent, 'desc': 'Tantangan yang lebih seru', 'stars': 2},
      {'nama': 'Susah', 'icon': Icons.sentiment_very_dissatisfied_rounded, 'color': AppColors.wrong, 'desc': 'Hanya untuk yang berani!', 'stars': 3},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.textPrimary)),
                    Expanded(child: Text('Kategori: $kategori', style: AppTextStyles.heading.copyWith(fontSize: 20), textAlign: TextAlign.center)),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              const Text('Pilih Tingkat Kesulitan', style: AppTextStyles.heading),
              const SizedBox(height: AppSpacing.sm),
              Text('Seberapa berani kamu?', style: AppTextStyles.subheading.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppSpacing.xl),

              // Difficulty cards
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: difficulties.map((diff) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: _buildDifficultyCard(context,
                          nama: diff['nama'] as String,
                          icon: diff['icon'] as IconData,
                          color: diff['color'] as Color,
                          desc: diff['desc'] as String,
                          stars: diff['stars'] as int,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDifficultyCard(BuildContext context, {
    required String nama, required IconData icon, required Color color, required String desc, required int stars,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => QuizScreen(kategori: kategori, kesulitan: nama),
        ));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.card, AppColors.cardLight]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Row(
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nama, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 4),
                  Text(desc, style: AppTextStyles.caption),
                  const SizedBox(height: 6),
                  Row(children: List.generate(3, (i) => Icon(Icons.star_rounded, size: 18, color: i < stars ? color : AppColors.textHint))),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: color.withValues(alpha: 0.7), size: 20),
          ],
        ),
      ),
    );
  }
}
