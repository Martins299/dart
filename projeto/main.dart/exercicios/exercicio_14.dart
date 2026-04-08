import 'dart:io';

void main() {
  stdout.write("Digite o tamanho do primeiro vetor: ");
  int n1 = int.parse(stdin.readLineSync()!);

  List<int> vetor1 = [];
  for (int i = 0; i < n1; i++) {
    stdout.write("Digite o ${i + 1}º elemento do primeiro vetor (em ordem): ");
    vetor1.add(int.parse(stdin.readLineSync()!));
  }

  stdout.write("\nDigite o tamanho do segundo vetor: ");
  int n2 = int.parse(stdin.readLineSync()!);

  List<int> vetor2 = [];
  for (int i = 0; i < n2; i++) {
    stdout.write("Digite o ${i + 1}º elemento do segundo vetor (em ordem): ");
    vetor2.add(int.parse(stdin.readLineSync()!));
  }

  List<int> vetor3 = [];
  int i = 0, j = 0;

  while (i < vetor1.length && j < vetor2.length) {
    if (vetor1[i] <= vetor2[j]) {
      vetor3.add(vetor1[i]);
      i++;
    } else {
      vetor3.add(vetor2[j]);
      j++;
    }
  }

  while (i < vetor1.length) {
    vetor3.add(vetor1[i]);
    i++;
  }
  while (j < vetor2.length) {
    vetor3.add(vetor2[j]);
    j++;
  }

  print("\n Vetor resultante ordenado ");
  print(vetor3);
}