import 'dart:io';

int fatorial(int n) {
  int resultado = 1;
  for (int i = 1; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}

void main() {
  stdout.write("Digite o valor de X: ");
  int x = int.parse(stdin.readLineSync()!);

  stdout.write("Digite o número de termos da série: ");
  int n = int.parse(stdin.readLineSync()!);
  int soma = 0;
  int potencia = x * x; 

  for (int i = 2; i <= n + 1; i++) {
    soma += potencia;
    potencia *= x;
  }

  print("Valor da série S: $soma");
  List<int> sequencia = [1, 2, 3, 4, 3, 2, 1, 1, 2, 3, 4];
  print("Valores da sequência de fatoriais:");

  for (int valor in sequencia) {
    print("$valor! = ${fatorial(valor)}");
  }
}