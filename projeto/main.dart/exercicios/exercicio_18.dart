import 'dart:io';

void desenharBoneco(int erros) {
  List<String> estados = [
    """
     +---+
     |   |
         |
         |
         |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
         |
         |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
     |   |
         |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
    /|   |
         |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
    /|\\  |
         |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
    /|\\  |
    /    |
         |
    =========
    """,
    """
     +---+
     |   |
     O   |
    /|\\  |
    / \\  |
         |
    =========
    """
  ];

  print(estados[erros]);
}

void jogar() {
  String palavra = "DART".toUpperCase();
  List<String> letras = palavra.split('');
  List<String> progresso = List.filled(letras.length, "_");

  int maxErros = 6;
  int erros = 0;
  List<String> tentativas = [];

  print("=== JOGO DA FORCA ===");
  print("Adivinhe a palavra oculta!");

  while (erros < maxErros && progresso.contains("_")) {
    print("\nPalavra: ${progresso.join(" ")}");
    print("Tentativas: $tentativas");
    print("Erros: $erros/$maxErros");

    stdout.write("Digite uma letra: ");
    String entrada = stdin.readLineSync()!.toUpperCase();

    if (entrada.length != 1 || !RegExp(r'[A-Z]').hasMatch(entrada)) {
      print("Digite apenas uma letra válida!");
      continue;
    }

    if (tentativas.contains(entrada)) {
      print("Você já tentou essa letra!");
      continue;
    }

    tentativas.add(entrada);

    if (letras.contains(entrada)) {
      for (int i = 0; i < letras.length; i++) {
        if (letras[i] == entrada) {
          progresso[i] = entrada;
        }
      }
      print("Boa! A letra $entrada está na palavra.");
    } else {
      erros++;
      print("Errado! A letra $entrada não está na palavra.");
      desenharBoneco(erros);
    }
  }

  if (!progresso.contains("_")) {
    print("\n Parabéns! Você descobriu a palavra: ${palavra}");
  } else {
    desenharBoneco(maxErros);
    print("\n Fim de jogo! O boneco foi enforcado.");
    print("A palavra era: ${palavra}");
  }
}

void main() {
  bool continuar = true;

  while (continuar) {
    jogar();

    stdout.write("\nDeseja tentar novamente? (S/N): ");
    String resposta = stdin.readLineSync()!.toUpperCase();

    if (resposta != "S") {
      continuar = false;
      print("\n ate mais! :) ");
    }
  }
}