import 'dart:io';
void main() {
  List<List<int>> vetores = [];
  for (int i = 1; i <= 4; i++) {
    stdout.write('Digite o tamanho do vetor $i: ');
    int tamanho = int.parse(stdin.readLineSync()!);

    List<int> vetor = [];
    for (int j = 0; j < tamanho; j++) {
      stdout.write('Digite o elemento ${j + 1} do vetor $i: ');
      int elemento = int.parse(stdin.readLineSync()!);
      vetor.add(elemento);
    }
    vetores.add(vetor);
  }

  List<int> quintoVetor = [];
  for (var v in vetores) {
    quintoVetor.addAll(v);
  }
  quintoVetor.sort();
  print('\n(a) Quinto vetor ordenado: $quintoVetor');

  Set<int> interseccao = vetores[0].toSet();
  for (int i = 1; i < vetores.length; i++) {
    interseccao = interseccao.intersection(vetores[i].toSet());
  }
  print('(b) Elementos comuns aos 4 vetores: $interseccao');
}