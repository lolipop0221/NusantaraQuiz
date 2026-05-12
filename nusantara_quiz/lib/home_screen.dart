import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'category_screen.dart';
import 'leaderboard_screen.dart';

// ============================================================
// HOME_SCREEN.DART — Halaman Menu Utama
// Dibuat oleh: Bustanill Arifin (Android Developer)
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.xl),
                _buildHeader(),
                const SizedBox(height: AppSpacing.xxl),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildMenuButton(context, icon: Icons.play_circle_filled_rounded, label: 'Mulai Kuis',
                            subtitle: 'Uji pengetahuanmu tentang Nusantara!',
                            gradient: AppGradients.primaryButton,
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryScreen()))),
                          const SizedBox(height: AppSpacing.md),
                          _buildMenuButton(context, icon: Icons.leaderboard_rounded, label: 'Leaderboard',
                            subtitle: 'Lihat peringkat pemain terbaik',
                            gradient: const LinearGradient(colors: [Color(0xFF1565C0), Color(0xFF1E88E5)]),
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LeaderboardScreen()))),
                          const SizedBox(height: AppSpacing.md),
                          _buildMenuButton(context, icon: Icons.info_outline_rounded, label: 'Tentang Aplikasi',
                            subtitle: 'Info tentang NusantaraQuiz',
                            gradient: const LinearGradient(colors: [Color(0xFF2E7D32), Color(0xFF43A047)]),
                            onTap: () => _showAboutDialog(context)),
                        ],
                      ),
                    ),
                  ),
                ),
                Text('NusantaraQuiz v1.0 — Kelompok 3', style: AppTextStyles.caption),
                const SizedBox(height: AppSpacing.sm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(children: [
      Container(
        width: 80, height: 80,
        decoration: BoxDecoration(
          gradient: AppGradients.primaryButton, borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.4), blurRadius: 15, offset: const Offset(0, 5))],
        ),
        child: const Icon(Icons.quiz_rounded, size: 40, color: Colors.white),
      ),
      const SizedBox(height: AppSpacing.md),
      const Text('NUSANTARA', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppColors.textPrimary, letterSpacing: 4.0)),
      ShaderMask(
        shaderCallback: (bounds) => AppGradients.goldGradient.createShader(bounds),
        child: const Text('QUIZ', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 8.0)),
      ),
      const SizedBox(height: AppSpacing.sm),
      Text('Bermain & Belajar Budaya Indonesia', style: AppTextStyles.caption.copyWith(fontSize: 14)),
    ]);
  }

  Widget _buildMenuButton(BuildContext context, {required IconData icon, required String label, required String subtitle, required Gradient gradient, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Row(children: [
          Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.white, size: 28)),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 2),
            Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.white.withValues(alpha: 0.8))),
          ])),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white.withValues(alpha: 0.7), size: 20),
        ]),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Tentang NusantaraQuiz', style: TextStyle(color: AppColors.textPrimary)),
      content: const Text(
        'NusantaraQuiz adalah aplikasi game kuis berbasis Android yang dirancang untuk mengedukasi sekaligus menghibur pengguna mengenai kekayaan budaya, sejarah, dan pengetahuan umum Indonesia.\n\nDikembangkan oleh Kelompok 3.',
        style: TextStyle(color: AppColors.textSecondary)),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup', style: TextStyle(color: AppColors.accent)))],
    ));
  }
}
