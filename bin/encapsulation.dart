class NilaiMahasiswa {
  double _nilai = 0;

  double get nilai => _nilai;

  void setNilai(double angka) {
    if(angka > 0) {
      _nilai = angka;
    }
  }
}
void main() {
  var mhs = NilaiMahasiswa();
  mhs.setNilai(88.8);
  print("Nilai mahasiswa adalah ${mhs.nilai}");
}