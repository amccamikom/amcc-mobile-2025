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
  SuaraHewan anjing = Anjing();
  SuaraHewan burung = Burung();

  anjing.bunyikan();
  burung.bunyikan();
}