import 'dart:io';

void main() {
  stdout.write("Digite o valor de N: ");
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];

  for (int i = 0; i < n; i++) {
    stdout.write("Digite o ${i + 1}º número: ");
    numeros.add(int.parse(stdin.readLineSync()!));
  }

  Map<int, int> frequencia = {};

  for (var num in numeros) {
    if (frequencia.containsKey(num)) {
      frequencia[num] = frequencia[num]! + 1;
    } else {
      frequencia[num] = 1;
    }
  }

  print("\n Resultado ");
  frequencia.forEach((num, qtd) {
    print("$num - $qtd");
  });
}