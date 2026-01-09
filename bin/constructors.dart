class Smartphone {
  String merk;
  String warna;
  int baterai;

  Smartphone(this.merk, this.warna, this.baterai);

  void cek() {
    print("hp $merk warna $warna dengan baterai ${baterai}mAh siap digunakan.");
  }
}

void main() {
  var hpAbe = Smartphone("Xiomi", "Ungu", 5000);
  var hpAgil = Smartphone("Iphone", "Biru", 3000);
  hpAbe.cek();
  hpAgil.cek();
}
