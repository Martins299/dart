import 'dart:io';

void main() {
  print('\n EXERCÍCIO 03: Sequência com Três Progressões \n');

  int termos = 25;
  int a = 1;
  int b = 5;
  int c = 100;

  print('Gerando $termos termos alternados:\n');
  print('Sequência: ');

  for (int i = 1; i <= termos; i++) {
    if (i % 3 == 1) {
      stdout.write('$a ');
      a *= 2;

    } else if (i % 3 == 2) {
      stdout.write('$b ');
      b += 5;

    } else {
      stdout.write('$c ');
      c -= 10;
    }
  }

  print('\n' + '-' * 50 + '\n');
}
