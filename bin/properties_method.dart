class mobil {
  String merk = "Toyota";
  int kecepatan = 0;

  void tambahKecepatan(int nilai) {
    kecepatan += nilai;
    print("Mobil $merk melaju dengan kecepatan $kecepatan km/jam");
  }
}

void main() {
  var mobilSaya = mobil();
  mobilSaya.merk = "Honda";
  mobilSaya.tambahKecepatan(60);
}
