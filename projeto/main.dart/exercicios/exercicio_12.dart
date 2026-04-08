import 'dart:io';
void main() {
  stdout.write("Digite um número: ");
  String numero = stdin.readLineSync()!;
  String invertido = numero.split('').reversed.join();

  print("Número invertido: $invertido");
}