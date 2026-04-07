void main() {
  print('\n EXERCÍCIO 02: Série Matemática com BigInt \n');

  int n = 7;
  BigInt soma = BigInt.zero;

  print('Calculando série para $n termos:\n');

  for (int i = 1; i <= n; i++) {
    int base = 2 * i + 1;
    int expoente = 4 * i;
    BigInt termo = BigInt.from(base).pow(expoente);

    if (i % 4 == 0 || i % 6 == 0) {
      soma -= termo;
      print('Termo $i: $base^$expoente = $termo (subtraído)');
      
    } else {
      soma += termo;
      print('Termo $i: $base^$expoente = $termo (adicionado)');
    }
  }

  print('\n' + '-' * 50);
  print('Resultado da série com $n termos:');
  print('$soma');
  print('-' * 50 + '\n');
}
