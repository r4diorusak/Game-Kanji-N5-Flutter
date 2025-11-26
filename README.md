<p align="center">
  <img src="assets/icon/icon.png" width="150" alt="Kanji N5 Gemini Logo">
</p>

<h1 align="center">Kanji N5 Gemini - Master Japanese N5</h1>

<p align="center">
  <strong>Kanji N5 Gemini</strong> adalah aplikasi Flutter komprehensif yang dirancang sebagai teman belajar all-in-one untuk siapa saja yang ingin menguasai dasar-dasar bahasa Jepang, khususnya pada level JLPT N5. Aplikasi ini menggabungkan metode pembelajaran tradisional dengan teknologi AI modern untuk menciptakan pengalaman belajar yang menarik dan efektif.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Badge">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart Badge">
  <img src="https://img.shields.io/badge/Google%20Gemini-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Gemini Badge">
</p>

---

## Daftar Isi

- [Tujuan Proyek](#tujuan-proyek)
- [Fitur Utama](#fitur-utama)
- [Arsitektur Proyek](#arsitektur-proyek)
- [Teknologi & Dependensi](#teknologi--dependensi)
- [Tangkapan Layar](#tangkapan-layar)
- [Persyaratan Sistem](#persyaratan-sistem)
- [Panduan Instalasi](#panduan-instalasi)
- [Cara Berkontribusi](#cara-berkontribusi)
- [Penulis](#penulis)

---

## Tujuan Proyek

Proyek ini dibuat untuk mengatasi tantangan umum yang dihadapi oleh pemula saat belajar bahasa Jepang:
1.  **Fragmentasi Sumber Belajar**: Pelajar sering kali harus menggunakan beberapa aplikasi atau buku yang berbeda untuk Kanji, kosakata, dan tata bahasa. Aplikasi ini menyatukan semuanya di satu tempat.
2.  **Pembelajaran Pasif**: Belajar dengan hanya membaca bisa membosankan. Fitur interaktif seperti kuis dan permainan dirancang untuk membuat proses belajar menjadi lebih aktif dan menyenangkan.
3.  **Kurangnya Bantuan Instan**: Ketika muncul pertanyaan spesifik, pelajar sering kesulitan mencari jawaban yang relevan. **Asisten AI Gemini** hadir untuk memberikan jawaban dan penjelasan instan, seolah-olah memiliki tutor pribadi.

---

## Fitur Utama

Aplikasi ini dikemas dengan berbagai fitur untuk mencakup semua aspek pembelajaran N5:

-   **Flashcard Kanji Interaktif**: Pelajari 103 Kanji esensial untuk level N5. Setiap kartu menampilkan Kanji, arti, serta cara baca Onyomi dan Kunyomi.
-   **Database Kosakata & Tata Bahasa**: Akses daftar lengkap kosakata dan pola tata bahasa N5 yang disajikan dengan jelas dan ringkas.
-   **Asisten AI Berbasis Gemini**: Punya pertanyaan? Manfaatkan kekuatan model AI generatif Google Gemini untuk bertanya apa saja tentang bahasa Jepang, mulai dari arti kata hingga penggunaan partikel yang rumit.
-   **Permainan Edukatif**:
    -   **Konjugasi Kata Kerja**: Latih refleks Anda dalam mengubah bentuk kata kerja (bentuk -masu, -te, kamus, dll.).
    -   **Mencocokkan Ekspresi**: Pasangkan ungkapan bahasa Jepang dengan terjemahan yang benar.
    -   **Teka-teki Partikel**: Isi partikel yang hilang (は, が, を, に, で, etc.) dalam kalimat untuk mengasah pemahaman Anda.
-   **Latihan Mendengar (Choukai)**: Tingkatkan kemampuan mendengar Anda dengan kuis audio di mana Anda harus memilih jawaban yang benar berdasarkan dialog singkat.
-   **Integrasi Video YouTube**: Belajar dari konten video pilihan tanpa harus meninggalkan aplikasi, berkat pemutar YouTube yang terintegrasi.
-   **Mode Cerita**: Benamkan diri Anda dalam cerita pendek untuk melihat bagaimana tata bahasa dan kosakata digunakan dalam konteks nyata.

---

## Arsitektur Proyek

Proyek ini mengikuti arsitektur berorientasi fitur yang modular untuk kemudahan pemeliharaan dan skalabilitas. Struktur utama dalam direktori `lib` adalah sebagai berikut:

-   **/data**: Berisi file-file Dart yang menyimpan data statis aplikasi, seperti daftar kanji, soal kuis, kosakata, dan tata bahasa.
-   **/models**: Mendefinisikan objek dan struktur data utama aplikasi (misalnya, `Kanji`, `Vocabulary`, `Grammar`).
-   **/screens**: Setiap file di sini mewakili satu layar atau halaman dalam aplikasi, mengelola UI dan state untuk fitur tertentu (misalnya, `AiChatScreen`, `KanjiScreen`).
-   **/services**: Mengelola logika untuk berkomunikasi dengan layanan eksternal. Saat ini berisi `GeminiService` yang menangani semua interaksi dengan Google Gemini API.
-   **/widgets**: Kumpulan widget kustom yang dapat digunakan kembali di berbagai layar (misalnya, `FlipCard`, `ChatItemWidget`) untuk menjaga konsistensi UI.
-   **/utils**: Berisi fungsi-fungsi pembantu dan utilitas, seperti `VerbConjugator` untuk logika konjugasi kata kerja.

---

## Teknologi & Dependensi

-   **Framework**: **Flutter (v3.x)** - Untuk membangun UI yang indah dan berperforma tinggi secara cross-platform.
-   **Bahasa**: **Dart (v3.x)** - Bahasa modern yang dioptimalkan untuk UI.
-   **AI & Machine Learning**:
    -   `google_generative_ai`: Klien Dart resmi untuk berinteraksi dengan **Google Gemini API**.
-   **UI & Multimedia**:
    -   `flutter_markdown`: Merender respons dari Gemini yang diformat dalam Markdown.
    -   `youtube_player_flutter`: Menyematkan pemutar video YouTube asli di dalam aplikasi.
-   **Utilitas**:
    -   `flutter_tts`: Mengimplementasikan fungsionalitas Text-to-Speech.
    -   `cupertino_icons`: Menyediakan ikon standar iOS.
-   **Dev Tools**:
    -   `flutter_launcher_icons`: Membuat ikon aplikasi secara otomatis.
    -   `flutter_native_splash`: Mengelola layar splash screen.

---

## Tangkapan Layar

*(Sangat disarankan untuk menambahkan beberapa gambar atau GIF yang menampilkan fitur-fitur utama aplikasi di sini.)*

<p align="center">
  <!-- <img src="docs/screenshot1.png" width="250"> -->
  <!-- <img src="docs/screenshot2.png" width="250"> -->
  <!-- <img src="docs/screenshot3.png" width="250"> -->
</p>

---

## Persyaratan Sistem

-   **Flutter SDK**: Versi 3.x atau lebih tinggi.
-   **Dart SDK**: Versi 3.x atau lebih tinggi.
-   **IDE**: Android Studio atau Visual Studio Code (dengan ekstensi Flutter & Dart).
-   **Perangkat**: Emulator Android (API 21+) atau perangkat fisik.

---

## Panduan Instalasi

Untuk menjalankan proyek ini secara lokal, ikuti langkah-langkah berikut:

1.  **Clone Repositori**
    ```sh
    git clone https://github.com/r4diorusak/Game-Kanji-N5-Flutter.git
    cd Game-Kanji-N5-Flutter
    ```

2.  **Dapatkan Dependensi Flutter**
    ```sh
    flutter pub get
    ```

3.  **Konfigurasi API Key Gemini**
    -   Pertama, dapatkan API key Anda dari **[Google AI Studio](https://aistudio.google.com/)**.
    -   Buka file `lib/services/gemini_service.dart`.
    -   Temukan baris berikut dan ganti `YOUR_API_KEY` dengan kunci yang Anda dapatkan:
        ```dart
        final apiKey = 'YOUR_API_KEY';
        ```

4.  **Jalankan Aplikasi**
    ```sh
    flutter run
    ```
    Pilih perangkat yang tersedia untuk menjalankan aplikasi.

---

## Cara Berkontribusi

Kontribusi dari komunitas sangat kami hargai! Jika Anda ingin membantu, silakan:

1.  **Fork** repositori ini.
2.  Buat **branch baru** untuk fitur atau perbaikan Anda (`git checkout -b fitur/nama-fitur`).
3.  **Commit** perubahan Anda (`git commit -m 'Menambahkan fitur X'`).
4.  **Push** ke branch Anda (`git push origin fitur/nama-fitur`).
5.  Buka **Pull Request**.

Beberapa area yang bisa dikembangkan:
-   Menambahkan konten untuk level JLPT N4.
-   Menyimpan progres belajar pengguna.
-   Meningkatkan UI/UX.
-   Menambahkan lebih banyak variasi kuis.

---

## Penulis

-   **Nama**: Khairul Adha S.Kom
-   **Email**: r4dioz.88@gmail.com
-   **GitHub**: [![GitHub](https://img.shields.io/badge/GitHub-r4diorusak-blue?style=flat-square&logo=github)](https://github.com/r4diorusak)

---

*Proyek ini dibuat sebagai bagian dari portofolio dan sebagai alat bantu bagi sesama pembelajar bahasa Jepang. Semoga bermanfaat!*
