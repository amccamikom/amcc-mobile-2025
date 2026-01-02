void main() {
  // operator aritmatika
  int a = 10;
  int b = 5;
  print('Penjumlahan: ${a + b}'); // 15
  print('Pengurangan: ${a - b}'); // 5
  print('Perkalian: ${a * b}'); // 50
  print('Pembagian: ${a / b}'); // 2.0
  print('Modulus: ${a % b}'); // 0


  // increment dan decrement
  int number = 5;
  number += 1; // increment
  print('Increment: $number'); // 6

  number -= 1; // decrement
  print('Decrement: $number'); // 5

  // operator perbandingan
  bool condition1 = true;
  bool condition2 = false;
  int number1 = 2;
  int number2 = 5;
  print(condition1 == condition2); // false
  print(condition1 != condition2); // true
  print(number1 > number2); // false
  print(number1 < number2); // true
  print(number1 >= number2); // false
  print(number1 <= number2); // true

  // operator logika
  print(condition1 && condition2); // false
  print(condition2 || condition1); // true
  print(!condition1); // false
}