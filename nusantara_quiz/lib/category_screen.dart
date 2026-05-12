import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'difficulty_screen.dart';

// ============================================================
// CATEGORY_SCREEN.DART — Halaman Pilih Kategori
// Dibuat oleh: Bustanill Arifin (Android Developer)
// ============================================================

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'nama': 'Budaya', 'icon': Icons.theater_comedy_rounded, 'color': AppColors.categoryBudaya, 'desc': 'Tari, musik, & adat istiadat'},
      {'nama': 'Sejarah', 'icon': Icons.menu_book_rounded, 'color': AppColors.categorySejarah, 'desc': 'Kerajaan, tokoh, & peristiwa'},
      {'nama': 'Bahasa Daerah', 'icon': Icons.translate_rounded, 'color': AppColors.categoryBahasa, 'desc': 'Aksara, salam, & kosa kata'},
      {'nama': 'Pengetahuan Umum', 'icon': Icons.public_rounded, 'color': AppColors.categoryUmum, 'desc': 'Geografi, flora, & fauna'},
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.backgroundGradient),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar custom
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_rounded, color: AppColors.textPrimary),
                    ),
                    const Expanded(
                      child: Text('Pilih Kategori', style: AppTextStyles.heading, textAlign: TextAlign.center),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text('Mau main kuis tentang apa?', style: AppTextStyles.subheading.copyWith(color: AppColors.textSecondary)),
              const SizedBox(height: AppSpacing.lg),

              // Grid kategori
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      return _buildCategoryCard(
                        context,
                        nama: cat['nama'] as String,
                        icon: cat['icon'] as IconData,
                        color: cat['color'] as Color,
                        desc: cat['desc'] as String,
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

  Widget _buildCategoryCard(BuildContext context, {
    required String nama, required IconData icon, required Color color, required String desc,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DifficultyScreen(kategori: nama),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [color.withValues(alpha: 0.8), color.withValues(alpha: 0.5)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: color.withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)),
                child: Icon(icon, color: Colors.white, size: 32),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(nama, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center),
              const SizedBox(height: AppSpacing.xs),
              Text(desc, style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.8)), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
