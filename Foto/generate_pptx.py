from pptx import Presentation
from pptx.util import Inches, Pt
from pptx.dml.color import RGBColor
from pptx.enum.text import PP_ALIGN
from pptx.enum.shapes import MSO_SHAPE
import os

prs = Presentation()
prs.slide_width = Inches(13.333)
prs.slide_height = Inches(7.5)

BG = RGBColor(0x0F,0x17,0x2A)
BG2 = RGBColor(0x0A,0x0F,0x1E)
BLUE = RGBColor(0x38,0xBD,0xF8)
PURPLE = RGBColor(0xA7,0x8B,0xFA)
GREEN = RGBColor(0x4A,0xDE,0x80)
YELLOW = RGBColor(0xFB,0xBF,0x24)
RED = RGBColor(0xF8,0x71,0x71)
WHITE = RGBColor(0xFF,0xFF,0xFF)
GRAY = RGBColor(0xCB,0xD5,0xE1)
CARD = RGBColor(0x1E,0x29,0x3B)

DIR = r"d:\TugasBesar"
FOTO_DIR = os.path.join(DIR, "Foto")
IMG_FLOW = os.path.join(DIR, "Aplikasi Login dan Skor Flow-2026-05-01-044110.png")
IMG_UC = os.path.join(DIR, "NusantaraQuiz User-2026-05-01-044412.png")
IMG_ERD = os.path.join(DIR, "NusantaraQuiz User-2026-05-01-044455.png")
IMG_UI = os.path.join(DIR, "ui_mockup.png")
IMG_TL = os.path.join(DIR, "project_timeline.png")

def bg(s, c=BG):
    s.background.fill.solid(); s.background.fill.fore_color.rgb = c

def rect(s, l, t, w, h, c):
    sh = s.shapes.add_shape(MSO_SHAPE.RECTANGLE, l, t, w, h)
    sh.fill.solid(); sh.fill.fore_color.rgb = c; sh.line.fill.background()
    return sh

def oval(s, l, t, w, h, c):
    sh = s.shapes.add_shape(MSO_SHAPE.OVAL, l, t, w, h)
    sh.fill.solid(); sh.fill.fore_color.rgb = c; sh.line.fill.background()
    return sh

def txt(s, l, t, w, h, text, sz=18, c=WHITE, b=False, a=PP_ALIGN.LEFT):
    tb = s.shapes.add_textbox(l, t, w, h)
    tf = tb.text_frame; tf.word_wrap = True
    p = tf.paragraphs[0]; p.text = text
    p.font.size = Pt(sz); p.font.color.rgb = c; p.font.bold = b; p.font.name = "Segoe UI"; p.alignment = a
    return tb

def line(s, l, t, w, c=BLUE):
    rect(s, l, t, w, Pt(4), c)

def bullets(s, items, top, left=Inches(1), w=Inches(11), sz=16, c=GRAY):
    for i, item in enumerate(items):
        txt(s, left, top + Inches(i*0.5), w, Inches(0.5), f"  {item}", sz, c)

def pic(s, path, l, t, w, h):
    if os.path.exists(path):
        rect(s, l-Inches(0.1), t-Inches(0.1), w+Inches(0.2), h+Inches(0.2), WHITE)
        s.shapes.add_picture(path, l, t, w, h)

def add_photo(s, path, l, t, size, border_color=BLUE):
    """Add a team member photo with a colored circular border."""
    border = Inches(0.05)
    # Circle border
    oval(s, l-border, t-border, size+border*2, size+border*2, border_color)
    # Photo (square, will be displayed inside the card)
    if os.path.exists(path):
        p = s.shapes.add_picture(path, l, t, size, size)
        # Crop to circle by using oval shape with picture fill would be ideal,
        # but python-pptx add_picture is rectangular. We use the photo as-is
        # inside the card layout for a clean look.

# === SLIDE 1: COVER ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s, BG2)
rect(s, Inches(0), Inches(3.2), Inches(13.333), Pt(3), BLUE)
rect(s, Inches(0), Inches(3.35), Inches(13.333), Pt(2), PURPLE)
txt(s, Inches(1), Inches(1.2), Inches(11), Inches(1), "PRAKTIKUM MINGGU 1", 20, BLUE, True, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(1.8), Inches(11), Inches(1.5), "Perancangan Sistem\n(Desain Awal)", 44, WHITE, True, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(3.8), Inches(11), Inches(1), "NusantaraQuiz", 36, PURPLE, True, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(4.6), Inches(11), Inches(0.8), "Aplikasi Game Kuis Budaya dan Pengetahuan Umum Indonesia", 18, GRAY, False, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(5.8), Inches(11), Inches(0.6), "Kelompok 3", 22, GREEN, True, PP_ALIGN.CENTER)

# === SLIDE 2: TIM ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Tim Pengembang - Kelompok 3", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), BLUE)
# Team data: (nama, role, nama_file_foto)
team = [("Amrosi","Project Manager & Android Developer","Rosi.png"),
        ("Ridho","UI/UX Designer","Ridho.png"),
        ("Abdus Saleh","Android Developer","Soleh.png"),
        ("Ana","Content Creator","Ana.png"),
        ("Bustanill Arifin","Android Developer","Bustanul.png"),
        ("Ita Riyanti","Android Developer","Ita.png"),
        ("Ilham Fajriyanto","Content Creator & QA","Ilham.png"),
        ("Azam Murahman","Android Developer","Azam.png")]
accent_colors = [BLUE, PURPLE, GREEN, YELLOW, RED, BLUE, PURPLE, GREEN]
card_w = Inches(2.9)
card_h = Inches(2.9)
photo_size = Inches(1.5)
for i,(n,r,foto) in enumerate(team):
    col, row = i%4, i//4
    x = Inches(0.45 + col*3.15)
    y = Inches(1.4 + row*3.05)
    ac = accent_colors[i]
    # Card background
    rect(s, x, y, card_w, card_h, CARD)
    # Top accent line on card
    rect(s, x, y, card_w, Pt(3), ac)
    # Photo - large and centered
    foto_path = os.path.join(FOTO_DIR, foto)
    photo_x = x + (card_w - photo_size) / 2  # center horizontally
    photo_y = y + Inches(0.18)
    add_photo(s, foto_path, photo_x, photo_y, photo_size, ac)
    # Name (below photo)
    txt(s, x+Inches(0.05), y+Inches(1.8), Inches(2.8), Inches(0.45), n, 18, WHITE, True, PP_ALIGN.CENTER)
    # Role (below name)
    txt(s, x+Inches(0.05), y+Inches(2.2), Inches(2.8), Inches(0.6), r, 12, GRAY, False, PP_ALIGN.CENTER)

# === SLIDE 3: LATAR BELAKANG (NEW) ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Latar Belakang", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), YELLOW)
problems = [
    ("Kurangnya media edukasi budaya yang interaktif dan menarik bagi generasi muda.",BLUE),
    ("Pengetahuan tentang budaya, sejarah, dan bahasa daerah Indonesia semakin menurun.",PURPLE),
    ("Metode pembelajaran konvensional kurang efektif untuk menarik minat anak muda.",GREEN),
]
for i,(p,ac) in enumerate(problems):
    y = Inches(1.5+i*1.6)
    rect(s, Inches(0.8), y, Inches(11.5), Inches(1.3), CARD)
    line(s, Inches(0.8), y, Inches(11.5), ac)
    txt(s, Inches(1.5), y+Inches(0.15), Inches(0.6), Inches(0.5), str(i+1), 28, ac, True, PP_ALIGN.CENTER)
    txt(s, Inches(2.2), y+Inches(0.3), Inches(9.8), Inches(0.8), p, 18, GRAY)
rect(s, Inches(0.8), Inches(6.3), Inches(11.5), Inches(0.9), RGBColor(0x16,0x3B,0x2B))
txt(s, Inches(1.0), Inches(6.4), Inches(11), Inches(0.7),
    "Solusi: Aplikasi kuis interaktif yang menggabungkan edukasi budaya Indonesia dengan gamifikasi.", 17, GREEN, True, PP_ALIGN.CENTER)

# === SLIDE 4: OVERVIEW ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Apa itu NusantaraQuiz?", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), GREEN)
txt(s, Inches(0.8), Inches(1.4), Inches(11.5), Inches(1.2),
    "NusantaraQuiz adalah aplikasi game kuis edukatif berbasis Android yang menyajikan pertanyaan seputar budaya, sejarah, dan pengetahuan umum Indonesia. Aplikasi ini memiliki fitur poin, timer, leaderboard, serta tingkat kesulitan yang bervariasi.", 18, GRAY)
features = [("Mode Kuis\nPilihan Ganda","Topik budaya, sejarah,\nbahasa daerah",BLUE),
            ("Sistem Timer\n& Poin","Tantangan menjawab\ndengan waktu terbatas",PURPLE),
            ("Leaderboard","Bersaing secara sehat\ndengan pemain lain",GREEN),
            ("Tingkat\nKesulitan","Mudah, Sedang,\ndan Susah",YELLOW)]
for i,(t,d,ac) in enumerate(features):
    x = Inches(0.5+i*3.1); y = Inches(3.2)
    rect(s, x, y, Inches(2.9), Inches(3.5), CARD); line(s, x, y, Inches(2.9), ac)
    txt(s, x+Inches(0.2), y+Inches(0.5), Inches(2.5), Inches(0.8), t, 20, WHITE, True, PP_ALIGN.CENTER)
    txt(s, x+Inches(0.2), y+Inches(1.8), Inches(2.5), Inches(1.2), d, 14, GRAY, False, PP_ALIGN.CENTER)

# === SLIDE 5: USER REQUIREMENT ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "1. User Requirement", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), BLUE)
rect(s, Inches(0.6), Inches(1.5), Inches(5.8), Inches(5.5), CARD)
txt(s, Inches(0.8), Inches(1.6), Inches(5.5), Inches(0.5), "Player (Pemain)", 24, BLUE, True)
line(s, Inches(0.8), Inches(2.15), Inches(5.3), BLUE)
for i,item in enumerate(["Mendaftar (Register) dan Masuk (Login)","Memilih kategori kuis (Budaya, Sejarah, dll)","Memilih tingkat kesulitan (Mudah, Sedang, Susah)","Memainkan kuis dengan sistem timer dan skor","Melihat Leaderboard (Papan Peringkat)"]):
    txt(s, Inches(1.0), Inches(2.4+i*0.5), Inches(5), Inches(0.5), f"  {item}", 15, GRAY)
txt(s, Inches(0.8), Inches(5.2), Inches(5.5), Inches(0.8), "Batasan: Hanya bisa membaca soal dan melihat skor.", 13, YELLOW)
rect(s, Inches(6.8), Inches(1.5), Inches(5.8), Inches(5.5), CARD)
txt(s, Inches(7.0), Inches(1.6), Inches(5.5), Inches(0.5), "Admin", 24, PURPLE, True)
line(s, Inches(7.0), Inches(2.15), Inches(5.3), PURPLE)
for i,item in enumerate(["Masuk (Login) khusus Admin","Mengelola (Tambah, Edit, Hapus) soal kuis","Mengelola kategori kuis","Melihat data statistik pemain"]):
    txt(s, Inches(7.2), Inches(2.4+i*0.5), Inches(5), Inches(0.5), f"  {item}", 15, GRAY)
txt(s, Inches(7.0), Inches(5.2), Inches(5.5), Inches(0.8), "Batasan: Tidak ikut bermain dalam leaderboard.", 13, YELLOW)

# === SLIDE 6: FLOWCHART ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "2. Flowchart - Alur Utama Aplikasi", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), GREEN)
pic(s, IMG_FLOW, Inches(0.7), Inches(1.4), Inches(5.3), Inches(5.7))
rect(s, Inches(6.5), Inches(1.3), Inches(6.3), Inches(5.9), CARD)
txt(s, Inches(6.7), Inches(1.5), Inches(5.9), Inches(0.5), "Penjelasan Alur:", 22, GREEN, True)
for i,item in enumerate(["Saat aplikasi dibuka, cek status login","Belum login -> halaman Login/Register","Sudah login -> Menu Utama (Dashboard)","Menu Main Kuis -> Pilih Kategori & Kesulitan","Jawab pertanyaan dengan timer berjalan","Hitung skor akhir -> Simpan ke Database","Menu Leaderboard -> Tampilkan peringkat","Menu Keluar -> Logout & tutup aplikasi"]):
    txt(s, Inches(6.9), Inches(2.2+i*0.5), Inches(5.5), Inches(0.5), f"  {item}", 15, GRAY)

# === SLIDE 7: USE CASE ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "3. Use Case Diagram", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), PURPLE)
pic(s, IMG_UC, Inches(1.0), Inches(1.4), Inches(4.7), Inches(5.7))
rect(s, Inches(6.5), Inches(1.3), Inches(6.3), Inches(5.9), CARD)
txt(s, Inches(6.7), Inches(1.5), Inches(5.9), Inches(0.5), "Aktor & Interaksi:", 22, PURPLE, True)
for i,item in enumerate(["Player & Admin -> Login / Register (shared)","Player -> Pilih Kategori & Level","Player -> Main Kuis","Player -> Lihat Leaderboard","Admin -> Kelola Soal Kuis (CRUD)","Admin -> Kelola Kategori","Admin -> Lihat Data Pemain"]):
    txt(s, Inches(6.9), Inches(2.2+i*0.5), Inches(5.5), Inches(0.5), f"  {item}", 15, GRAY)
txt(s, Inches(6.7), Inches(5.8), Inches(5.9), Inches(0.8), "Pembagian hak akses yang jelas antara Player dan Admin.", 14, YELLOW)

# === SLIDE 8: ERD ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "4. Database Design (ERD)", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), YELLOW)
pic(s, IMG_ERD, Inches(0.5), Inches(1.5), Inches(7.8), Inches(5.5))
rect(s, Inches(8.7), Inches(1.3), Inches(4.3), Inches(5.9), CARD)
txt(s, Inches(8.9), Inches(1.5), Inches(4), Inches(0.5), "4 Tabel Utama:", 22, YELLOW, True)
for i,(tn,td) in enumerate([("PENGGUNA","id, nama, password, peran"),("KATEGORI","id, nama_kategori"),("PERTANYAAN","id, soal, opsi A-D, jawaban, level"),("SKOR","id, id_pengguna, id_kategori, poin")]):
    y = Inches(2.2+i*1.1)
    txt(s, Inches(9.0), y, Inches(3.8), Inches(0.4), tn, 16, BLUE, True)
    txt(s, Inches(9.0), y+Inches(0.35), Inches(3.8), Inches(0.5), td, 13, GRAY)

# === SLIDE 9: RELASI DATABASE ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Relasi Antar Tabel", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), GREEN)
for i,(t1,t2,desc,ac) in enumerate([("PENGGUNA","SKOR","Satu Pengguna memiliki banyak Skor (1:N)",BLUE),("KATEGORI","PERTANYAAN","Satu Kategori memiliki banyak Pertanyaan (1:N)",PURPLE),("KATEGORI","SKOR","Satu Kategori terkait dengan banyak Skor (1:N)",GREEN)]):
    y = Inches(1.6+i*1.8)
    rect(s, Inches(1), y, Inches(11), Inches(1.5), CARD); line(s, Inches(1), y, Inches(11), ac)
    txt(s, Inches(1.3), y+Inches(0.2), Inches(10), Inches(0.5), f"{t1}  ->  {t2}", 24, ac, True)
    txt(s, Inches(1.3), y+Inches(0.75), Inches(10), Inches(0.5), desc, 16, GRAY)

# === SLIDE 10: TEKNOLOGI (NEW) ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Teknologi yang Digunakan", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), BLUE)
techs = [
    ("Flutter (Dart)", "Framework utama untuk pengembangan aplikasi Android cross-platform", BLUE),
    ("SQLite / Firebase", "Database untuk menyimpan data pengguna, soal, dan skor", PURPLE),
    ("Android Studio", "IDE utama untuk development dan debugging aplikasi", GREEN),
    ("Material Design 3", "Design system untuk tampilan modern dan konsisten", YELLOW),
    ("Git & GitHub", "Version control dan kolaborasi tim pengembang", RED),
]
for i,(name,desc,ac) in enumerate(techs):
    y = Inches(1.4+i*1.15)
    rect(s, Inches(0.8), y, Inches(11.5), Inches(1.0), CARD)
    rect(s, Inches(0.8), y, Pt(5), Inches(1.0), ac)
    txt(s, Inches(1.3), y+Inches(0.1), Inches(4), Inches(0.4), name, 20, ac, True)
    txt(s, Inches(1.3), y+Inches(0.5), Inches(10.5), Inches(0.4), desc, 14, GRAY)

# === SLIDE 11: UI MOCKUP (NEW) ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Rancangan Tampilan Aplikasi (UI Mockup)", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), PURPLE)
if os.path.exists(IMG_UI):
    s.shapes.add_picture(IMG_UI, Inches(0.5), Inches(1.3), Inches(12.3), Inches(5.9))

# === SLIDE 12: TIMELINE (NEW) ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Timeline Pengembangan Proyek", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), GREEN)
if os.path.exists(IMG_TL):
    s.shapes.add_picture(IMG_TL, Inches(0.5), Inches(1.5), Inches(12.3), Inches(4.5))
phases = [("Minggu 1-2","Perancangan Sistem",BLUE),("Minggu 3-5","Implementasi UI",PURPLE),
          ("Minggu 6-8","Implementasi Backend",GREEN),("Minggu 9-10","Testing & Deploy",YELLOW)]
for i,(w,p,ac) in enumerate(phases):
    x = Inches(0.5+i*3.2)
    rect(s, x, Inches(6.3), Inches(3.0), Inches(0.9), CARD)
    rect(s, x, Inches(6.3), Inches(3.0), Pt(3), ac)
    txt(s, x+Inches(0.1), Inches(6.4), Inches(2.8), Inches(0.35), w, 13, ac, True, PP_ALIGN.CENTER)
    txt(s, x+Inches(0.1), Inches(6.7), Inches(2.8), Inches(0.35), p, 14, WHITE, False, PP_ALIGN.CENTER)

# === SLIDE 13: KESIMPULAN (NEW) ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s)
txt(s, Inches(0.8), Inches(0.4), Inches(11), Inches(0.7), "Kesimpulan Minggu 1", 32, WHITE, True)
line(s, Inches(0.8), Inches(1.05), Inches(3), YELLOW)
conclusions = [
    ("User Requirement telah teridentifikasi dengan jelas (Player & Admin).", BLUE),
    ("Flowchart alur aplikasi telah dirancang dari login hingga selesai bermain.", GREEN),
    ("Use Case Diagram memvisualisasikan pembagian hak akses tiap role.", PURPLE),
    ("Database dengan 4 tabel utama dan relasinya telah dirancang.", YELLOW),
    ("Teknologi pengembangan (Flutter, SQLite/Firebase) telah ditentukan.", RED),
]
for i,(c,ac) in enumerate(conclusions):
    y = Inches(1.5+i*1.1)
    rect(s, Inches(0.8), y, Inches(11.5), Inches(0.9), CARD)
    rect(s, Inches(0.8), y, Pt(5), Inches(0.9), ac)
    rect(s, Inches(1.2), y+Inches(0.2), Inches(0.5), Inches(0.5), ac)
    txt(s, Inches(1.2), y+Inches(0.2), Inches(0.5), Inches(0.5), str(i+1), 16, BG2, True, PP_ALIGN.CENTER)
    txt(s, Inches(2.0), y+Inches(0.2), Inches(10), Inches(0.5), c, 17, GRAY)

# === SLIDE 14: PENUTUP ===
s = prs.slides.add_slide(prs.slide_layouts[6]); bg(s, BG2)
rect(s, Inches(0), Inches(3.2), Inches(13.333), Pt(3), BLUE)
rect(s, Inches(0), Inches(3.35), Inches(13.333), Pt(2), PURPLE)
txt(s, Inches(1), Inches(1.5), Inches(11), Inches(1), "Terima Kasih", 48, WHITE, True, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(2.5), Inches(11), Inches(0.6), "Sesi Tanya Jawab", 24, BLUE, False, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(4.0), Inches(11), Inches(1), "NusantaraQuiz - Kelompok 3", 28, PURPLE, True, PP_ALIGN.CENTER)
txt(s, Inches(1), Inches(5.0), Inches(11), Inches(0.8), "Melestarikan budaya dan sejarah Indonesia melalui permainan yang menyenangkan.", 16, GRAY, False, PP_ALIGN.CENTER)

out = os.path.join(DIR, "Presentasi_Minggu_1_NusantaraQuiz_v3.pptx")
prs.save(out)
print(f"[OK] Presentasi berhasil disimpan: {out}")
print(f"Total slide: {len(prs.slides)}")
