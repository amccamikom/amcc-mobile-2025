# 🚀 Pelatihan Dart: Struktur Data & Async Programming

Proyek pembelajaran **Dart** yang mencakup berbagai konsep penting seperti struktur data (List, Map, Set) dan pemrograman asynchronous (Future, async/await).

## 📚 Materi yang Dipelajari

### 1️⃣ **List** (`bin/list.dart`)
Koleksi data yang **boleh duplikat** dan **berurutan**.
```bash
dart run bin/list.dart
```
**Yang dipelajari:**
- Deklarasi List
- Method `.add()` - menambah elemen
- Method `.remove()` - menghapus elemen
- Akses elemen berdasarkan index

---

### 2️⃣ **Set** (`bin/set.dart`)
Koleksi data yang **tidak boleh duplikat** (hanya elemen unik).
```bash
dart run bin/set.dart
```
**Yang dipelajari:**
- Deklarasi Set
- Penghapusan otomatis elemen duplikat
- Operasi himpunan (union, intersection, difference)
- Kegunaan: data unik, validasi, performa pencarian

---

### 3️⃣ **Map** (`bin/map.dart`)
Koleksi data pasangan **key-value** (kamus/dictionary).
```bash
dart run bin/map.dart
```
**Yang dipelajari:**
- Deklarasi Map dengan tipe key-value
- Akses data berdasarkan key
- Iterasi Map
- Kegunaan: relasi data, lookup cepat

---

### 4️⃣ **Future** (`bin/future.dart`)
Menangani operasi asynchronous dengan `.then()` **callback-based**.
```bash
dart run bin/future.dart
```
**Yang dipelajari:**
- Future sebagai placeholder untuk nilai yang akan datang
- Method `.then()` untuk menangani hasil
- Non-blocking execution
- Fetch data dari API dummy (JSONPlaceholder)

---

### 5️⃣ **Async/Await** (`bin/asyncawait.dart`)
Menangani operasi asynchronous dengan **syntax synchronous-like**.
```bash
dart run bin/asyncawait.dart
```
**Yang dipelajari:**
- Keyword `async` dan `await`
- Sequential execution (menunggu sampai selesai)
- Lebih readable dibanding `.then()`
- Error handling dengan `try/catch`

---

## 🔄 Perbandingan Future vs Async/Await

| Fitur | Future (.then) | Async/Await |
|-------|---|---|
| **Style** | Callback-based | Synchronous-like |
| **Readability** | Kompleks | Mudah dibaca |
| **Execution** | Non-blocking | Sequential |
| **Error Handling** | `.catch()` | `try/catch` |
| **Recommended** | ❌ Legacy | ✅ Modern |

---

## 🎯 Struktur Proyek

```
pelatihan4/
├── bin/                    # Executable files
│   ├── list.dart          # Contoh List
│   ├── set.dart           # Contoh Set
│   ├── map.dart           # Contoh Map
│   ├── future.dart        # Contoh Future + API
│   └── asyncawait.dart    # Contoh Async/Await
├── lib/
│   └── pelatihan4.dart    # Library code
├── test/
│   └── pelatihan4_test.dart
├── pubspec.yaml           # Dependencies
└── README.md
```

---

## 🛠️ Setup & Cara Menjalankan

### Prerequisites
- Install [Dart SDK](https://dart.dev/get-dart)

### Install Dependencies
```bash
dart pub get
```

### Jalankan Satu File
```bash
dart run bin/list.dart
dart run bin/set.dart
dart run bin/map.dart
dart run bin/future.dart
dart run bin/asyncawait.dart
```

### Jalankan Semua Sekaligus
```bash
dart run bin/list.dart && \
dart run bin/set.dart && \
dart run bin/map.dart && \
dart run bin/future.dart && \
dart run bin/asyncawait.dart
```

---

## 💡 Tips & Trik

✅ **Gunakan List** ketika butuh koleksi dengan urutan dan duplikat diizinkan  
✅ **Gunakan Set** ketika butuh data unik dan operasi himpunan  
✅ **Gunakan Map** ketika butuh relasi key-value yang cepat diakses  
✅ **Gunakan async/await** untuk code async yang lebih clean dan readable  
✅ **Gunakan Future.wait()** untuk eksekusi multiple futures secara parallel

---

## 🔗 Resource Tambahan

- [Dart Documentation](https://dart.dev/guides)
- [Dart Collections](https://dart.dev/guides/libraries/library-tour#collections)
- [Async Programming](https://dart.dev/guides/libraries/library-tour#dartasync---asynchronous-programming)
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)

---

## 📝 Catatan Pembelajaran

Setiap file di folder `bin/` adalah contoh standalone yang bisa dijalankan langsung. Modifikasi dan eksperimen dengan kode untuk memahami konsep lebih dalam! 🎓

**Happy Learning! 🚀**
