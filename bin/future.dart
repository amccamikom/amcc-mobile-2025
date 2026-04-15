// Fungsi simulasi mengambil data profil user dari database
Future<String> fetchUser() {
  // Kita beri delay 3 detik untuk simulasi proses loading
  return Future.delayed(Duration(seconds: 3), () => 'Nama: Muhammad Firdaus');
}

void main() {
  print('Mulai mengambil data...'); // Baris ini jalan pertama
  
  fetchUser().then((hasil) {
    print(hasil); // Baris ini baru jalan setelah 3 detik 
  });
  
  print('Menunggu data selesai...'); // Baris ini tetap jalan tanpa menunggu fetchUser selesai 
} 


// Alur Eksekusi
// 1. Print: 'Mulai mengambil data...' (langsung)
// 2. Print: 'Menunggu data selesai...' (langsung, TIDAK tunggu)
// 3. [tunggu 3 detik...]
// 4. Print: 'Nama: Muhammad Firdaus' (setelah 3 detik)
