abstract class RemoteTV {
  void tekanTombolPower();
}

class SamsungRemote extends RemoteTV {
  @override
  void tekanTombolPower() {
    print("TV Samsung Menyala");
  }
}

class SharpRemote extends RemoteTV {
  @override
  void tekanTombolPower() {
    print("TV Sharp Menyala");
  }
}

void main() {
  RemoteTV remote1 = SamsungRemote();
  RemoteTV remote2 = SharpRemote();

  remote1.tekanTombolPower();
  remote2.tekanTombolPower();
}