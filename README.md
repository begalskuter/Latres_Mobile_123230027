# 📺 TV Show App - Latihan Responsi Praktikum Mobile IF-E

Aplikasi ini merupakan hasil pengerjaan **Latihan Responsi Praktikum Mobile IF-E** yang dikerjakan pada **19 Mei 2026** di kelas **Praktikum Mobile IF-E Semester 6**.

Aplikasi dibuat menggunakan **Flutter** dengan menerapkan:

- **GetX** untuk state management, routing, dan dependency injection
- **Hive** untuk penyimpanan data favorit secara lokal
- **SharedPreferences** untuk menyimpan session login
- **HTTP** untuk mengambil data dari API publik TVMaze
- **Cached Network Image** untuk menampilkan poster TV Show
- **Flutter HTML** untuk menampilkan summary dari API

---

## ✨ Fitur Aplikasi

### 🔐 Login Page
- Input username dan password bebas
- Menyimpan status login menggunakan SharedPreferences
- Session tetap tersimpan meskipun aplikasi ditutup
- Logout menghapus session dan kembali ke halaman login

### 🏠 Home Page
- Menampilkan daftar TV Show dari API TVMaze
- Data ditampilkan dalam bentuk grid
- Menampilkan:
  - Poster
  - Judul Show
  - Rating
- Loading indicator saat mengambil data
- Klik item untuk melihat detail

### 📄 Detail Page
- Menampilkan informasi lengkap TV Show:
  - Poster
  - Judul
  - Rating
  - Genre
  - Summary/Overview
- Tombol untuk menambah atau menghapus dari daftar favorit

### ❤️ Favorite Page
- Menampilkan daftar TV Show yang telah ditandai sebagai favorit
- Data disimpan menggunakan Hive
- Dapat menghapus item dari daftar favorit
- Klik item untuk membuka halaman detail

### 👤 Profile Page
- Menampilkan username yang sedang login
- Menampilkan kesan dan pesan selama praktikum
- Tombol logout yang berfungsi dengan baik

---

## 🌐 API yang Digunakan

Aplikasi menggunakan API publik dari TVMaze:

- Daftar TV Show: https://api.tvmaze.com/shows
- Detail TV Show: https://api.tvmaze.com/shows/{id}

---

## 🛠️ Teknologi yang Digunakan

- Flutter
- Dart
- GetX
- Hive
- SharedPreferences
- HTTP
- Cached Network Image
- Flutter HTML

---

## 📂 Struktur Folder

```text
lib/
├── controllers/
│   ├── detail_controller.dart
│   ├── favorite_controller.dart
│   ├── home_controller.dart
│   ├── login_controller.dart
│   ├── main_controller.dart
│   └── profile_controller.dart
├── models/
│   └── show_model.dart
├── routes/
│   ├── app_pages.dart
│   └── app_routes.dart
├── services/
│   ├── api_service.dart
│   ├── auth_service.dart
│   └── favorite_service.dart
├── views/
│   ├── detail_view.dart
│   ├── favorite_view.dart
│   ├── home_view.dart
│   ├── login_view.dart
│   ├── main_view.dart
│   └── profile_view.dart
└── main.dart