void main() {
  // if else
  int number = 5;
  if (number > 0) {
    print('bilangan positif');
  } else {
    print('bilangan negatif');
  }

  // conditional expression
  var name = 'daus ganteng';
  var buyer = name ?? 'user';
  print(buyer);

  // ternary operator
  var nilai = 80;
  String keterangan = (nilai >= 75) ? 'lulus' : 'tidak lulus';
  print(keterangan);

  // switch case
  var grade = 'A';
  switch (grade) {
    case 'A':
      print('nilai sempurna');
      break;
    case 'B':
      print('nilai bagus');
      break;
    case 'C':
      print('nilai cukup');
      break;
    case 'D':
      print('nilai kurang');
      break;
    case 'E':
      print('nilai jelek');
      break;
    default:
      print('nilai tidak valid'); 
  }
}   