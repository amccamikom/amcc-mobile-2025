Future<void> getData() async {
  print('Sedang mengambil data...');
  // Simulasi delay 2 detik
  await Future.delayed(Duration(seconds: 2)); 
  print('Data berhasil diterima!');
}

void main() async {
  await getData();
  print('Selesai!');
}

// alur eksekusi:
// 1. Print: 'Sedang mengambil data...' (langsung)
// 2. [tunggu 2 detik... PAUSE di sini]
// 3. Print: 'Data berhasil diterima!' (setelah 2 detik)
// 4. Print: 'Selesai!' (segera setelah step 3)