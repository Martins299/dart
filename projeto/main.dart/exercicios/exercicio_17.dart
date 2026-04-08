import 'dart:io';

List<int> lerVetor(int tamanho, String nome) {
  List<int> vetor = [];
  print('\nDigite os elementos do $nome:');
  for (int i = 0; i < tamanho; i++) {
    stdout.write('Elemento ${i + 1}: ');
    int valor = int.parse(stdin.readLineSync()!);
    vetor.add(valor);
  }
  return vetor;
}

List<int> somarVetores(List<int> v1, List<int> v2) {
  List<int> resultado = [];
  for (int i = 0; i < v1.length; i++) {
    resultado.add(v1[i] + v2[i]);
  }
  return resultado;
}

int somaTotal(List<int> vetor) {
  int soma = 0;
  for (var valor in vetor) {
    soma += valor;
  }
  return soma;
}

void main() {
  stdout.write('Digite o tamanho dos vetores: ');
  int tamanho = int.parse(stdin.readLineSync()!);
  List<int> vetor1 = lerVetor(tamanho, "vetor 1");
  List<int> vetor2 = lerVetor(tamanho, "vetor 2");
  List<int> vetor3 = somarVetores(vetor1, vetor2);

  print('\nVetor 1: $vetor1');
  print('Vetor 2: $vetor2');
  print('Vetor 3 (soma): $vetor3');
  int total = somaTotal(vetor3);
  print('Soma de todos os elementos do vetor 3: $total');
}