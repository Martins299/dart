import 'dart:io';

void main() {
  List<Map<String, dynamic>> bebes = [];

  int baixoPeso = 0;
  int normal = 0;
  int altoPeso = 0;

  String nomeMaiorF = "";
  double maiorPesoF = -1;

  while (true) {
    print("\n MENU");
    print("1 - Cadastrar bebê");
    print("2 - Listar bebês cadastrados");
    print("3 - Mostrar menina com maior peso");
    print("4 - Mostrar percentuais por classificação");
    print("5 - Sair");
    stdout.write("Escolha uma opção: ");
    int opcao = int.parse(stdin.readLineSync()!);

    if (opcao == 1) {
      stdout.write("Digite o nome do bebê: ");
      String nome = stdin.readLineSync()!;

      stdout.write("Digite o sexo (M/F): ");
      String sexo = stdin.readLineSync()!.toUpperCase();

      stdout.write("Digite o peso (kg): ");
      double peso = double.parse(stdin.readLineSync()!);

      String classificacao;
      if (peso <= 2) {
        classificacao = "Baixo Peso";
        baixoPeso++;
      } else if (peso <= 4) {
        classificacao = "Normal";
        normal++;
      } else {
        classificacao = "Alto Peso";
        altoPeso++;
      }

      bebes.add({
        "nome": nome,
        "sexo": sexo,
        "peso": peso,
        "classificacao": classificacao
      });

      if (sexo == "F" && peso > maiorPesoF) {
        maiorPesoF = peso;
        nomeMaiorF = nome;
      }

      print("Bebê cadastrado com sucesso!");

    } else if (opcao == 2) {
      if (bebes.isEmpty) {
        print("Nenhum bebê foi cadastrado.");
      } else {
        print("\n=== LISTA DE BEBÊS ===");
        for (var b in bebes) {
          print("${b['nome']} - Sexo: ${b['sexo']} - Classificação: ${b['classificacao']}");
        }
      }

    } else if (opcao == 3) {
      if (nomeMaiorF.isEmpty) {
        print("Nenhuma menina cadastrada.");
      } else {
        print("Menina com maior peso: $nomeMaiorF ($maiorPesoF kg)");
      }

    } else if (opcao == 4) {
      int total = bebes.length;
      if (total == 0) {
        print("Nenhum bebê foi cadastrado.");
      } else {
        print("Percentual Baixo Peso: ${(baixoPeso * 100 / total).toStringAsFixed(2)}%");
        print("Percentual Normal: ${(normal * 100 / total).toStringAsFixed(2)}%");
        print("Percentual Alto Peso: ${(altoPeso * 100 / total).toStringAsFixed(2)}%");
      }

    } else if (opcao == 5) {
      print("Encerrando programa...");
      break;

    } else {
      print("Opção inválida!");
    }
  }
}