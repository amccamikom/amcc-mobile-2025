abstract class RemoteTV {
  void tekanTombolPower();
  void nyalainTV(bool status);
}

class SamsungRemote extends RemoteTV {
  @override
  void tekanTombolPower() {
    print("TV Samsung menyala.");
  }

  @override
  void nyalainTV(bool status) {
    String message;
    if(status == true) {
      message = "Menyala";
      print("TV Status : $message");
    } else {
      message = "Mati";
      print("TV Status : $message");
    }
    
  }
}

class SharpRemote extends RemoteTV {
  @override
  void tekanTombolPower() {
    print("TV Sharp menyala.");
  }

  @override
  void nyalainTV(bool status) {
    String message;
    if(status == true) {
      message = "Menyala";
      print("TV Status : $message");
    } else {
      message = "Mati";
      print("TV Status : $message");
    }
  }
}

void main() {
  RemoteTV remote1 = SamsungRemote();
  RemoteTV remote2 = SharpRemote();

  remote1.tekanTombolPower();
  remote2.tekanTombolPower();
  remote1.nyalainTV(true);
  remote2.nyalainTV(false);
}