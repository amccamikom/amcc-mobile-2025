/// Fungsi ini menghitung luas persegi panjang.
///
/// [panjang] adalah panjang dari persegi panjang.
/// [lebar] adalah lebar dari persegi panjang.
/// Fungsi ini akan mengembalikan hasil perkalian panjang dan lebar.
int hitungLuasPersegiPanjang(int panjang, int lebar) {
  return panjang * lebar;
}

/// Kelas [PersegiPanjang] digunakan untuk merepresentasikan objek persegi panjang.
class PersegiPanjang {
  int panjang;
  int lebar;
  PersegiPanjang(this.panjang, this.lebar);

  /// Fungsi [hitungLuas] menghitung luas dari persegi panjang ini.
  int hitungLuas() {
    return panjang * lebar;
  }
}

void main() {
  var persegiPanjang = PersegiPanjang(10, 5);
  print(persegiPanjang.hitungLuas()); // Output: 50
}