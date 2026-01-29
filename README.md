**Bahasa:** [🇮🇩 Indonesian](README.md) | [🇺🇸 English](README.en.md)

<div align="center">
  <img src="assets/logo/logo.png" alt="Logo NovelVerse" width="200"/>
  
  # NovelVerse
  
  **Lacak Buku buku Favorit Anda**
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
  [![Platform](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android)](https://www.android.com/)
  
  [![GitHub stars](https://img.shields.io/github/stars/SidqiRaafi/NovelVerse?style=social)](https://github.com/SidqiRaafi/NovelVerse/stargazers)
  [![GitHub forks](https://img.shields.io/github/forks/SidqiRaafi/NovelVerse?style=social)](https://github.com/SidqiRaafi/NovelVerse/network/members)
  [![GitHub issues](https://img.shields.io/github/issues/SidqiRaafi/NovelVerse)](https://github.com/SidqiRaafi/NovelVerse/issues)
  [![GitHub pull requests](https://img.shields.io/github/issues-pr/SidqiRaafi/NovelVerse)](https://github.com/SidqiRaafi/NovelVerse/pulls)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/SidqiRaafi/NovelVerse/pulls)
  [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/SidqiRaafi/NovelVerse/graphs/commit-activity)
  
  [Fitur](#fitur) • [Demo](#demo) • [Unduh](#unduh) • [Pengembangan](#pengembangan) • [Kontribusi](#kontribusi) • [Lisensi](#lisensi)
  
</div>

---

## 📖 Tentang

NovelVerse adalah aplikasi pelacak buku kolaboratif yang dibangun dengan Flutter dan Firebase. NovelVerse menyediakan platform yang dimana user bisa menemukan, menambahkan, dan mengelola buku favoritnya. NovelVerse melakukan sinkronisasi agar semua user memiliki satu daftar yang sama, membuat NovelVerse sangat cocok untuk komunitas yang ingin berbagi dan merekomendasikan buku favorit mereka.

<a name="fitur"></a>
## ✨ Fitur

- 🔐 **Autentikasi Pengguna** - Sistem login dan registrasi yang aman
- 📚 **Manajemen Novel** - Tambah, edit, dan hapus novel dengan informasi detail
  - Judul, Penulis, Genre
  - URL Cover untuk tampilan visual
  - Rating dan Sinopsis
- 🔍 **Fungsi Pencarian** - Temukan novel dengan cepat di koleksi Anda berdasarkan judul, penulis, atau genre
- 👤 **Manajemen Profil** - Lihat detail akun, statistik, dan logout
- ℹ️ **Halaman Tentang** - Pelajari tentang pengembang dan aplikasi
- 🏛️ **Perpustakaan Bersama** - Setiap pengguna bisa membaca buku rekomendasi dari user lainnya
- 📱 **UI Modern** - Antarmuka yang bersih dan intuitif dengan desain elegan

<a name="demo"></a>
## 🎬 Demo

### Tangkapan Layar

<div align="center">
  <img src="assets/demo/splash.png" alt="Layar Splash" width="200"/>
  <img src="assets/demo/welcome.png" alt="Layar Selamat Datang" width="200"/>
  <img src="assets/demo/login.png" alt="Layar Login" width="200"/>
  <img src="assets/demo/register.png" alt="Layar Registrasi" width="200"/>
</div>

<div align="center">
  <img src="assets/demo/home1.png" alt="Layar Beranda" width="200"/>
  <img src="assets/demo/home2.png" alt="Layar Detail Novel" width="200"/>
  <img src="assets/demo/home3.png" alt="Layar Tambah Novel" width="200"/>
</div>

<div align="center">
  <img src="assets/demo/home4.png" alt="Layar Edit Novel" width="200"/>
  <img src="assets/demo/home5.png" alt="Layar Hapus Novel" width="200"/>
  <img src="assets/demo/profile.png" alt="Layar Profil" width="200"/>
  <img src="assets/demo/about.png" alt="Layar Tentang" width="200"/>
</div>

### Video Demo

<div align="center">
  <a href="https://youtu.be/-scBAf0Sv0s">
    <img src="https://img.youtube.com/vi/-scBAf0Sv0s/maxresdefault.jpg" alt="Video Demo NovelVerse 1" width="80%">
  </a>
  <p><i>🎥 Video Demo 1 - Demo via Windows</i></p>
</div>

<div align="center">
  <a href="https://youtu.be/-7pl_pC2xR8">
    <img src="https://img.youtube.com/vi/-7pl_pC2xR8/maxresdefault.jpg" alt="Video Demo NovelVerse 2" width="80%">
  </a>
  <p><i>🎥 Video Demo 2 - Demo Via Android</i></p>
</div>

<a name="unduh"></a>
## 📥 Unduh

### Untuk Pengguna

Unduh APK terbaru dari halaman [Releases](https://github.com/SidqiRaafi/NovelVerse/releases).

**Persyaratan:**
- **Versi Android Minimum**: Android 5.0 (API 21) atau lebih tinggi
- Minimum 50MB penyimpanan kosong
- Koneksi internet untuk layanan Firebase

**Instalasi:**
1. Unduh file `.apk` terbaru dari releases
2. Aktifkan "Instal dari Sumber Tidak Dikenal" di pengaturan Android Anda
3. Buka APK yang diunduh dan ikuti petunjuk instalasi
4. Jalankan NovelVerse dan buat akun Anda!

<a name="pengembangan"></a>
## 🛠️ Pengembangan

### Prasyarat

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Versi stabil terbaru per Januari 2026)
- [Dart SDK](https://dart.dev/get-dart) (Disertakan dengan Flutter)
- Android Studio / VS Code (atau IDE pilihan Anda)
- [Akun Firebase](https://firebase.google.com/)
- [Firebase CLI](https://firebase.google.com/docs/cli) (untuk menghasilkan firebase_options.dart)
- Git

### Pengaturan Firebase

1. **Buat Proyek Firebase**
   - Kunjungi [Firebase Console](https://console.firebase.google.com/)
   - Buat proyek baru atau gunakan yang sudah ada

2. **Aktifkan Autentikasi**
   - Di Firebase Console, buka **Authentication**
   - Klik "Get Started"
   - Aktifkan metode sign-in **Email/Password**

3. **Pengaturan Database Firestore**
   - Buka **Firestore Database**
   - Klik "Create database"
   - Pilih **Start in production mode** atau **Test mode** (untuk pengembangan)
   - Pilih region terdekat dengan Anda
   - Buat koleksi bernama `novels` dengan field berikut:
     ```
     - author (string)
     - coverUrl (string)
     - genre (string)
     - rating (number)
     - synopsis (string)
     - title (string)
     ```

4. **Unduh File Konfigurasi**
   - Di Project Settings, klik "Add app" dan pilih **Android**
   - Masukkan nama paket: `com.sawitkiawan.novelverse`
   - Unduh `google-services.json`
   - Letakkan di direktori `android/app/`

5. **Hasilkan Firebase Options**
   ```bash
   # Instal FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Konfigurasi Firebase untuk proyek Anda
   flutterfire configure
   ```
   - Pilih proyek Firebase Anda
   - Pilih platform (minimal: Android)
   - Ini akan menghasilkan `lib/firebase_options.dart` secara otomatis

### Pengaturan Lokal

```bash
# Clone repository
git clone https://github.com/SidqiRaafi/NovelVerse.git
cd NovelVerse

# Instal dependensi
flutter pub get

# Jalankan aplikasi (pastikan Anda telah menyelesaikan pengaturan Firebase terlebih dahulu)
flutter run
```

> **⚠️ Penting:** Aplikasi tidak akan berjalan tanpa konfigurasi Firebase yang tepat. Pastikan Anda telah menyelesaikan semua langkah pengaturan Firebase dan memiliki `google-services.json` dan `firebase_options.dart` di tempatnya.

### Build APK

```bash
# Build APK rilis
flutter build apk --release

# Build APK terpisah per ABI (ukuran file lebih kecil)
flutter build apk --split-per-abi
```

APK akan dihasilkan di `build/app/outputs/flutter-apk/`

### File Konfigurasi (Tidak Ada di Repository)

File-file ini berisi konfigurasi sensitif dan ada di `.gitignore`:
- `android/app/google-services.json` - Konfigurasi Firebase Android
- `lib/firebase_options.dart` - Opsi inisialisasi Firebase

**Catatan:** Hubungi maintainer jika Anda memerlukan akses ke proyek Firebase yang ada untuk tujuan pengembangan.

## 🗂️ Struktur Proyek

```
android/
├── app/
│   └── google-services.json        // tanya maintainer  ✔️
│
assets/
├── logo/
│   └── logo.png                    // logo aplikasi        ✔️
│
├── demo/
│   ├── splash.png                  // tampilan layar splash         ✔️
│   ├── welcome.png                 // tampilan layar selamat datang ✔️
│   ├── login.png                   // tampilan layar login          ✔️
│   ├── register.png                // tampilan layar registrasi     ✔️
│   ├── home1.png                   // tampilan layar beranda        ✔️
│   ├── home2.png                   // tampilan layar novel          ✔️
│   ├── home3.png                   // tampilan layar tambah novel   ✔️
│   ├── home4.png                   // tampilan layar edit novel     ✔️
│   ├── home5.png                   // tampilan layar hapus novel    ✔️
│   ├── profile.png                 // tampilan layar profil         ✔️
│   └── about.png                   // tampilan layar tentang app    ✔️
│
lib/
├── models/
│   ├── novel.dart                  // model data novel    ✔️
│   └── user.dart                   // model data user     ✔️
│
├── screens/
│   ├── auth/
│   │   ├── auth_page.dart          // form login dan register     ✔️
│   │   └── welcome_page.dart       // pilih login register        ✔️
│   │
│   ├── home/
│   │   ├── add_novel_page.dart     // form tambah novel           ✔️
│   │   ├── detail_page.dart        // detail novel                ✔️
│   │   ├── edit_novel_page.dart    // edit novel                  ✔️
│   │   ├── list_page.dart          // list novel dan search       ✔️
│   │   └── main_page.dart          // navigasi                    ✔️
│   │
│   ├── profile/
│   │   ├── about_page.dart         // info app dan dev            ✔️
│   │   └── profile_page.dart       // tentang user dan logout     ✔️
│   └── splash_screen.dart          // splash screen               ✔️
│
├── services/
│   ├── auth_service.dart           // Firebase Auth Login dan Register      ✔️
│   └── firestore_service.dart      // operasi CRUD Novel                    ✔️
│
├── widgets/
│   └── auth_wrapper.dart           // Sistem Login Persisten                ✔️
│
├── firebase_options.dart           // tanya maintainer                      ✔️
└── main.dart                       // entry point                           ✔️
```

<a name="kontribusi"></a>
## 🤝 Kontribusi

Kami menerima kontribusi dari komunitas! Berikut cara Anda dapat membantu:

1. **Fork repository**
2. **Buat branch fitur**
   ```bash
   git checkout -b feature/FiturKeren
   ```
3. **Commit perubahan Anda**
   ```bash
   git commit -m 'Menambahkan FiturKeren'
   ```
4. **Push ke branch**
   ```bash
   git push origin feature/FiturKeren
   ```
5. **Buka Pull Request**

### Panduan Kontribusi

- Ikuti gaya dan struktur kode yang ada
- Tulis pesan commit yang jelas dan deskriptif
- Uji perubahan Anda secara menyeluruh sebelum mengirimkan
- Perbarui dokumentasi jika diperlukan
- Bersikap hormat dan konstruktif dalam diskusi

Untuk detail lebih lanjut, lihat [CONTRIBUTING.md](CONTRIBUTING.md).

## 🚀 Rencana Masa Depan

- 📖 Kemampuan untuk mengunggah dan membaca bab novel
- 🔖 Bookmark novel favorit
- ⭐ Sistem rating dan review yang ditingkatkan
- 🔔 Notifikasi untuk pembaruan
- 🍎 Dukungan platform iOS
- 🌙 Tema mode gelap
- 🌐 Dukungan multi-bahasa

<a name="kontributor"></a>
## 👥 Kontributor

Kenali tim di balik NovelVerse:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/SidqiRaafi">
        <img src="https://github.com/SidqiRaafi.png" width="100px;" alt="Sidqi Raafi"/><br />
        <sub><b>Sidqi Raafi</b></sub>
      </a><br />
      <sub>23552011395</sub><br />
      <sub>Lead Developer & Maintainer</sub>
    </td>
    <td align="center">
      <a href="https://github.com/Parzival-Desu">
        <img src="https://github.com/Parzival-Desu.png" width="100px;" alt="Rayhan Khadafi"/><br />
        <sub><b>Rayhan Khadafi</b></sub>
      </a><br />
      <sub>23552011302</sub><br />
      <sub>Authentication & Logo Designer</sub>
    </td>
    <td align="center">
      <a href="https://github.com/Faichese">
        <img src="https://github.com/Faichese.png" width="100px;" alt="Faisal M"/><br />
        <sub><b>Faisal M</b></sub>
      </a><br />
      <sub>23552012015</sub><br />
      <sub>User & Profile Firebase Integration</sub>
    </td>
    <td align="center">
      <a href="https://github.com/rynrifn">
        <img src="https://github.com/rynrifn.png" width="100px;" alt="Rifki Febrian"/><br />
        <sub><b>Rifki Febrian</b></sub>
      </a><br />
      <sub>23552011430</sub><br />
      <sub>Splashscreen & About Implementation</sub>
    </td>
  </tr>
</table>

<a name="lisensi"></a>
## 📄 Lisensi

Proyek ini dilisensikan di bawah Lisensi MIT - lihat file [LICENSE](LICENSE) untuk detailnya.

## 📞 Kontak & Dukungan

Jika Anda memiliki pertanyaan, saran, atau masalah:

- 🐛 [Laporkan Bug](https://github.com/SidqiRaafi/NovelVerse/issues)
- 💡 [Minta Fitur](https://github.com/SidqiRaafi/NovelVerse/issues)
- 📧 Hubungi maintainer melalui GitHub

## ⭐ Tunjukkan Dukungan Anda

Jika Anda merasa NovelVerse bermanfaat, pertimbangkan untuk memberinya bintang! Ini membantu orang lain menemukan proyek ini dan memotivasi kami untuk terus memperbaikinya.

---

<div align="center">
  Dibuat dengan Flutter 💙
  <br/>
  <sub>Dibangun dengan semangat untuk pecinta buku di mana saja</sub>
</div>
