<p align="center">
  <img src="assets/icon/icon.png" width="150" alt="Kanji N5 Gemini Logo">
</p>

<h1 align="center">Kanji N5 Gemini</h1>

<p align="center">
  Sebuah aplikasi Flutter yang dirancang untuk membantu pengguna mempelajari dan menguasai Kanji, tata bahasa, dan kosakata bahasa Jepang setara level N5. Aplikasi ini dilengkapi dengan berbagai fitur interaktif, termasuk kuis, permainan, dan asisten AI yang didukung oleh Google Gemini untuk menjawab pertanyaan terkait bahasa Jepang.
</p>

---

## Daftar Isi

- [Fitur Utama](#fitur-utama)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Tangkapan Layar](#tangkapan-layar)
- [Persyaratan](#persyaratan)
- [Instalasi](#instalasi)
- [Penulis](#penulis)

---

## Fitur Utama

- **Pembelajaran Kanji**: Kartu balik (flip cards) untuk mempelajari Kanji N5 beserta cara baca (Onyomi & Kunyomi) dan artinya.
- **Pembelajaran Kosakata**: Daftar kosakata penting untuk level N5.
- **Pembelajaran Tata Bahasa**: Penjelasan pola kalimat dan tata bahasa N5 yang mudah dipahami.
- **AI Chat Assistant (Gemini)**: Ajukan pertanyaan apa pun seputar bahasa Jepang (Kanji, kosakata, tata bahasa) dan dapatkan jawaban cerdas dari AI Gemini.
- **Kuis Choukai (Mendengar)**: Latih kemampuan mendengar Anda dengan kuis pilihan ganda berbasis audio.
- **Permainan Mencocokkan Ekspresi**: Permainan interaktif untuk menguji pemahaman ekspresi dan artinya.
- **Permainan Konjugasi Kata Kerja**: Latih kemampuan Anda dalam mengubah bentuk kata kerja bahasa Jepang.
- **Permainan Partikel**: Uji pemahaman Anda tentang penggunaan partikel dalam kalimat.
- **Pembelajaran Video**: Belajar melalui video yang terintegrasi langsung di dalam aplikasi.
- **Mode Cerita**: Belajar bahasa Jepang melalui cerita interaktif.

---

## Teknologi yang Digunakan

### Framework & Bahasa Pemrograman
- **Flutter**: Framework UI dari Google untuk membangun aplikasi mobile, web, dan desktop dari satu basis kode.
- **Dart**: Bahasa pemrograman yang digunakan untuk mengembangkan aplikasi Flutter.

### API & Layanan
- **Google Generative AI (Gemini)**: Digunakan sebagai dasar untuk fitur AI Chat Assistant, memungkinkan interaksi tanya jawab yang dinamis.

### State Management
- **StatefulWidget & `setState`**: Pendekatan manajemen state bawaan dari Flutter yang digunakan untuk mengelola state lokal pada widget.

### Dependensi Utama (`pubspec.yaml`)
- `google_generative_ai`: Untuk berinteraksi dengan Google Gemini API.
- `flutter_markdown`: Untuk merender teks dalam format Markdown dari respons AI.
- `flutter_tts`: Untuk fitur Text-to-Speech, mengubah teks menjadi suara.
- `youtube_player_flutter`: Untuk memutar video YouTube di dalam aplikasi.
- `cupertino_icons`: Menyediakan set ikon gaya iOS.

---

## Tangkapan Layar

*(Disarankan untuk menambahkan beberapa gambar tangkapan layar aplikasi di sini untuk memberikan gambaran visual)*

---

## Persyaratan

- **Flutter SDK**: Versi 3.x atau lebih tinggi.
- **Dart SDK**: Versi 3.x atau lebih tinggi.
- **Android Studio** atau **Visual Studio Code** dengan ekstensi Flutter.
- **API Key untuk Google Gemini**: Anda perlu mendapatkan API key dari [Google AI Studio](https://aistudio.google.com/) dan memasukkannya ke dalam kode (biasanya di `gemini_service.dart`).

---

## Instalasi

1.  **Clone repositori ini:**
    ```bash
    git clone https://github.com/r4diorusak/Game-Kanji-N5-Flutter.git
    cd Game-Kanji-N5-Flutter
    ```

2.  **Install dependensi:**
    ```bash
    flutter pub get
    ```

3.  **Masukkan API Key Gemini Anda:**
    - Buka file `lib/services/gemini_service.dart`.
    - Ganti nilai placeholder `YOUR_API_KEY` dengan API key Anda yang sebenarnya.

4.  **Jalankan aplikasi:**
    ```bash
    flutter run
    ```

---

## Penulis

- **Nama**: Khairul Adha S.Kom
- **Email**: r4dioz.88@gmail.com
- **GitHub**: [r4diorusak](https://github.com/r4diorusak)
