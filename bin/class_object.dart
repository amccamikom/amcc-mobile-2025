class Smartphone {
  String? merk;
  String? warna;
  int? baterai;

  void spesifikasi() {
    print("Merk: $merk");
    print("Warna: $warna");
    print("Baterai: ${baterai}mAh");
  }
}

void main() {
  var hpBudi = Smartphone();
  hpBudi.merk = "Samsung";
  hpBudi.warna = "Hitam";
  hpBudi.baterai = 5000;
  hpBudi.spesifikasi();
}
