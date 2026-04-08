import 'dart:io';

void mostrarMapa(List<List<String>> mapa) {
  for (var linha in mapa) {
    print(linha.join(" "));
  }
}

void main() {
  List<List<String>> mapa = [
    ["#", "#", "#", "#", "#", "#", "#"],
    ["#", "@", " ", " ", "#", " ", "#"],
    ["#", " ", "#", " ", "#", " ", "#"],
    ["#", " ", "#", " ", " ", " ", "#"],
    ["#", " ", "#", "#", "#", " ", "#"],
    ["#", " ", " ", " ", " ", "S", "#"],
    ["#", "#", "#", "#", "#", "#", "#"],
  ];

  int jogadorLinha = 1;
  int jogadorColuna = 1;
  bool venceu = false;

  print(" JOGO DO LABIRINTO ");
  print("Use W (cima), A (esquerda), S (baixo), D (direita).");
  mostrarMapa(mapa);

  while (!venceu) {
    stdout.write("Movimento: ");
    String comando = stdin.readLineSync()!.toUpperCase();

    int novaLinha = jogadorLinha;
    int novaColuna = jogadorColuna;

    if (comando == "W") novaLinha--;
    else if (comando == "S") novaLinha++;
    else if (comando == "A") novaColuna--;
    else if (comando == "D") novaColuna++;
    else {
      print("Comando inválido!");
      continue;
    }

    if (mapa[novaLinha][novaColuna] != "#") {
      mapa[jogadorLinha][jogadorColuna] = " ";
      jogadorLinha = novaLinha;
      jogadorColuna = novaColuna;
      mapa[jogadorLinha][jogadorColuna] = "@";
    } else {
      print("Bateu na parede.");
    }

    mostrarMapa(mapa);

    if (mapa[jogadorLinha][jogadorColuna] == "S" || (jogadorLinha == 5 && jogadorColuna == 5)) {
      print("\n Parabéns, Você encontrou a saída!");
      venceu = true;
    }
  }
}