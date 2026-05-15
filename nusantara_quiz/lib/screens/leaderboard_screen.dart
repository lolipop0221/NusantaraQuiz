import 'package:flutter/material.dart';
import '../utils/constants.dart';

// ============================================================
// LEADERBOARD_SCREEN.DART — Halaman Leaderboard (Layout Only - Minggu 2)
// Dibuat oleh: Ita Riyanti (Android Developer)
// ============================================================

/// Untuk Minggu 2: Menampilkan layout leaderboard dengan data dummy.
/// Penyimpanan skor real (SharedPreferences) akan diimplementasi di Minggu 4.
class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk tampilan minggu 2
    final dummyScores = [
      {'nama': 'Amrosi', 'skor': 950, 'kategori': 'Budaya'},
      {'nama': 'Ridho', 'skor': 870, 'kategori': 'Sejarah'},
      {'nama': 'Bustanill', 'skor': 820, 'kategori': 'Budaya'},
      {'nama': 'Ana', 'skor': 780, 'kategori': 'Bahasa'},
      {'nama': 'Abdus Saleh', 'skor': 750, 'kategori': 'Umum'},
      {'nama': 'Ita', 'skor': 720, 'kategori': 'Sejarah'},
      {'nama': 'Ilham', 'skor': 680, 'kategori': 'Budaya'},
      {'nama': 'Azam', 'skor': 650, 'kategori': 'Bahasa'},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // App bar
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.textPrimary)),
                    const Expanded(child: Text('Leaderboard', style: AppTextStyles.heading, textAlign: TextAlign.center)),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // Top 3 podium
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 2nd place
                    _buildPodium(dummyScores[1]['nama'] as String, dummyScores[1]['skor'] as int, 2, 90),
                    const SizedBox(width: 8),
                    // 1st place
                    _buildPodium(dummyScores[0]['nama'] as String, dummyScores[0]['skor'] as int, 1, 120),
                    const SizedBox(width: 8),
                    // 3rd place
                    _buildPodium(dummyScores[2]['nama'] as String, dummyScores[2]['skor'] as int, 3, 70),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Daftar skor lainnya
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface, borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: dummyScores.length - 3,
                    itemBuilder: (context, index) {
                      final rank = index + 4;
                      final data = dummyScores[rank - 1];
                      return Container(
                        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            SizedBox(width: 30, child: Text('#$rank', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold))),
                            const SizedBox(width: AppSpacing.sm),
                            CircleAvatar(radius: 18, backgroundColor: AppColors.cardLight, child: Text((data['nama'] as String)[0], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(data['nama'] as String, style: const TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                              Text(data['kategori'] as String, style: AppTextStyles.caption),
                            ])),
                            Text('${data['skor']}', style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.bold, fontSize: 18)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPodium(String nama, int skor, int rank, double height) {
    final colors = {1: AppColors.accent, 2: const Color(0xFFC0C0C0), 3: const Color(0xFFCD7F32)};
    final medals = {1: '🥇', 2: '🥈', 3: '🥉'};
    final color = colors[rank]!;

    return Column(
      children: [
        Text(medals[rank]!, style: const TextStyle(fontSize: 28)),
        const SizedBox(height: 4),
        CircleAvatar(radius: rank == 1 ? 30 : 24, backgroundColor: color.withValues(alpha: 0.3),
          child: Text(nama[0], style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: rank == 1 ? 22 : 18))),
        const SizedBox(height: 4),
        Text(nama, style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600, fontSize: rank == 1 ? 14 : 12)),
        Text('$skor', style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Container(width: 80, height: height, decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [color.withValues(alpha: 0.6), color.withValues(alpha: 0.2)]),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        )),
      ],
    );
  }
}
