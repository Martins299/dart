import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int numeroSecreto = random.nextInt(100) + 1;

  print("Tente adivinhar o número entre 1 e 100!");

  while (true) {
    stdout.write("Digite seu chute: ");
    int chute = int.parse(stdin.readLineSync()!);

    if (chute == numeroSecreto) {
      print("Parabéns! Você acertou o número: $numeroSecreto");
      break;

    } else if (chute > numeroSecreto) {
      print("Você errou! O número correto era $numeroSecreto.");
      print("O número está entre 0 e $chute");
      
    } else {
      print("Você errou! O número correto era $numeroSecreto.");
      print("O número está entre $chute e 100");
    }
  }
}