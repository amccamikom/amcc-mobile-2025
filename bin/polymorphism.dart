class SuaraHewan {
  void bunyikan() => print("Hewan bersuara");
}

class Anjing extends SuaraHewan {
  @override
  void bunyikan() => print("Guk Guk!");
}

class Burung extends SuaraHewan {
  @override
  void bunyikan() => print("Cuit Cuit!");
}

void main() {
  List<SuaraHewan> daftarHewan = [Anjing(), Burung()];

  for(var hewan in daftarHewan) {
    hewan.bunyikan(); // Method (fungsi) yang sama tapi hasilnya berbeda.
  }
}