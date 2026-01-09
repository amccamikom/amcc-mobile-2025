void sapa() {
  print("Halo, selamat datang!");
}

void perkenalan(String nama, String divisi) {
  print("Halo, nama saya $nama dari divisi $divisi.");
}

void infoPelatihan({required String materi, int? jam}) {
  print("Hari ini belajar $materi selama $jam jam.");
}

void main() {
  infoPelatihan(materi: "Dart OOP", jam: 3);
}
