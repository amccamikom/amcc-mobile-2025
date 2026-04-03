class Hewan {
  void bernafas() => print("Sedang bernafas...");
}

class Kucing extends Hewan {
  void mengeong() => print("Meong!");
}

void main() {
  var kucing = Kucing();
  kucing.bernafas(); // Hasil dari pewarisan
  kucing.mengeong(); // Milik sendiri
}