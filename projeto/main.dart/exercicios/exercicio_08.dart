import 'dart:io';

class Candidato {
  String codigo;
  String curso;
  String nome;
  String sexo;
  int pontuacao;
  Candidato(this.codigo, this.curso, this.nome, this.sexo, this.pontuacao);
}

void main() {
  List<Candidato> candidatos = [];

  while (true) {
    print("\n MENU PRINCIPAL ");
    print("1 - Cadastrar candidatos");
    print("2 - Relatórios");
    print("0 - Sair");
    stdout.write("Escolha uma opção: ");
    String opcao = stdin.readLineSync()!;

    if (opcao == "0") break;

    switch (opcao) {
      case "1":
        while (true) {
          stdout.write("Digite o código (ou '0000' para encerrar): ");
          String codigo = stdin.readLineSync()!;
          if (codigo == "0000") break;

          stdout.write("Curso (CC ou SI): ");
          String curso = stdin.readLineSync()!;

          stdout.write("Nome: ");
          String nome = stdin.readLineSync()!;

          stdout.write("Sexo (M/F): ");
          String sexo = stdin.readLineSync()!;

          stdout.write("Pontuação (0-5000): ");
          int pontuacao = int.parse(stdin.readLineSync()!);

          candidatos.add(Candidato(codigo, curso, nome, sexo, pontuacao));
        }
        break;

      case "2":
        if (candidatos.isEmpty) {
          print("\nNenhum candidato cadastrado ainda!");
          break;
        }

        while (true) {
          print("\n===== MENU RELATÓRIOS =====");
          print("1 - Candidatos de CC com mais de 2500 pontos");
          print("2 - Nome do candidato masculino com menor pontuação geral");
          print("3 - Código do candidato masculino com maior pontuação em SI");
          print("4 - Percentual de candidatos por sexo");
          print("0 - Voltar");
          stdout.write("Escolha uma opção: ");
          String rel = stdin.readLineSync()!;

          if (rel == "0") break;

          switch (rel) {
            case "1":
              print("\nCandidatos de Ciência da Computação com mais de 2500 pontos:");
              for (var c in candidatos) {
                if (c.curso == "CC" && c.pontuacao > 2500) {
                  print("Código: ${c.codigo}, Nome: ${c.nome}, Pontuação: ${c.pontuacao}");
                }
              }
              break;

            case "2":
              var homens = candidatos.where((c) => c.sexo == "M").toList();
              if (homens.isNotEmpty) {
                var menor = homens.reduce((a, b) => a.pontuacao < b.pontuacao ? a : b);
                print("\nCandidato masculino com menor pontuação geral: ${menor.nome} (${menor.pontuacao})");
              } else {
                print("\nNão há candidatos masculinos cadastrados.");
              }
              break;

            case "3":
              var homensSI = candidatos.where((c) => c.sexo == "M" && c.curso == "SI").toList();
              if (homensSI.isNotEmpty) {
                var maiorSI = homensSI.reduce((a, b) => a.pontuacao > b.pontuacao ? a : b);
                print("\nCódigo do candidato masculino com maior pontuação em SI: ${maiorSI.codigo} (${maiorSI.pontuacao})");
              } else {
                print("\nNão há candidatos masculinos no curso de SI.");
              }
              break;

            case "4":
              int total = candidatos.length;
              int qtdM = candidatos.where((c) => c.sexo == "M").length;
              int qtdF = candidatos.where((c) => c.sexo == "F").length;

              double percM = (qtdM / total) * 100;
              double percF = (qtdF / total) * 100;

              print("\nPercentual de candidatos:");
              print("Masculino: ${percM.toStringAsFixed(2)}%");
              print("Feminino: ${percF.toStringAsFixed(2)}%");
              break;

            default:
              print("\nOpção inválida.");
          }
        }
        break;

      default:
        print("\nOpção inválida.");
    }
  }

  print("\nPrograma encerrado.");
}