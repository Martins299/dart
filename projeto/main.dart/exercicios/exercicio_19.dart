import 'dart:io';

void mostrarTabuleiro(List<List<String>> tabuleiro) {
  print("\n   1   2   3");
  print("A  ${tabuleiro[0][0]} | ${tabuleiro[0][1]} | ${tabuleiro[0][2]}");
  print("  ---+---+---");
  print("B  ${tabuleiro[1][0]} | ${tabuleiro[1][1]} | ${tabuleiro[1][2]}");
  print("  ---+---+---");
  print("C  ${tabuleiro[2][0]} | ${tabuleiro[2][1]} | ${tabuleiro[2][2]}");
}

bool verificarVitoria(List<List<String>> t, String jogador) {
  for (int i = 0; i < 3; i++) {
    if (t[i][0] == jogador && t[i][1] == jogador && t[i][2] == jogador) return true;
  }

  for (int j = 0; j < 3; j++) {
    if (t[0][j] == jogador && t[1][j] == jogador && t[2][j] == jogador) return true;
  }

  if (t[0][0] == jogador && t[1][1] == jogador && t[2][2] == jogador) return true;
  if (t[0][2] == jogador && t[1][1] == jogador && t[2][0] == jogador) return true;

  return false;
}

bool verificarEmpate(List<List<String>> t) {
  for (var linha in t) {
    if (linha.contains(" ")) return false;
  }
  return true;
}

List<int>? converterCoordenada(String entrada) {
  entrada = entrada.toUpperCase();
  if (entrada.length != 2) return null;

  Map<String, int> linhas = {"A": 0, "B": 1, "C": 2};
  Map<String, int> colunas = {"1": 0, "2": 1, "3": 2};

  String letra = entrada[0];
  String numero = entrada[1];

  if (!linhas.containsKey(letra) || !colunas.containsKey(numero)) return null;

  return [linhas[letra]!, colunas[numero]!];
}

void jogar() {
  List<List<String>> tabuleiro = List.generate(3, (_) => List.filled(3, " "));
  String jogadorAtual = "X";
  bool fimDeJogo = false;

  print(" JOGO DA VELHA ");
  print("Use coordenadas (ex: A1, B2, C3)");

  while (!fimDeJogo) {
    mostrarTabuleiro(tabuleiro);
    print("\nVez do jogador $jogadorAtual");

    stdout.write("Escolha uma posição: ");
    String entrada = stdin.readLineSync()!.toUpperCase();

    List<int>? posicao = converterCoordenada(entrada);

    if (posicao == null) {
      print("Coordenada inválida! Use A-C e 1-3.");
      continue;
    }

    int linha = posicao[0];
    int coluna = posicao[1];

    if (tabuleiro[linha][coluna] != " ") {
      print("Posição já ocupada, tente outra!");
      continue;
    }

    tabuleiro[linha][coluna] = jogadorAtual;

    if (verificarVitoria(tabuleiro, jogadorAtual)) {
      mostrarTabuleiro(tabuleiro);
      print("\n Jogador $jogadorAtual venceu!");
      fimDeJogo = true;
    } else if (verificarEmpate(tabuleiro)) {
      mostrarTabuleiro(tabuleiro);
      print("\n Empate! O tabuleiro está cheio.");
      fimDeJogo = true;
    } else {
      jogadorAtual = (jogadorAtual == "X") ? "O" : "X";
    }
  }
}

void main() {
  bool continuar = true;

  while (continuar) {
    jogar();

    stdout.write("\nDesejam jogar novamente? (S/N): ");
    String resposta = stdin.readLineSync()!.toUpperCase();

    if (resposta != "S") {
      continuar = false;
      print("\n Até mais! :) ");
    }
  }
}