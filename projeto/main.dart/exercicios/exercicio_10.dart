import 'dart:io';

void main() {
  List<Map<String, dynamic>> candidatos = [];

  while (true) {
    print("\n===== MENU =====");
    print("1 - Inserir candidato");
    print("2 - Mostrar resultados");
    print("3 - Sair");
    stdout.write("Escolha uma opção: ");
    String? opcao = stdin.readLineSync();

    if (opcao == "1") {
      stdout.write("Nome: ");
      String? nome = stdin.readLineSync();
      if (nome == null || nome.toUpperCase() == "FIM") {
        continue;
      }

      stdout.write("Sexo (M/F): ");
      String? sexo = stdin.readLineSync();

      stdout.write("Idade: ");
      int idade = int.parse(stdin.readLineSync()!);

      stdout.write("Tem experiência (S/N): ");
      String? experiencia = stdin.readLineSync();

      candidatos.add({
        "nome": nome,
        "sexo": sexo?.toUpperCase(),
        "idade": idade,
        "experiencia": experiencia?.toUpperCase()
      });

    } else if (opcao == "2") {
      int homens = candidatos.where((c) => c["sexo"] == "M").length;
      int mulheres = candidatos.where((c) => c["sexo"] == "F").length;

      var homensExp = candidatos
          .where((c) => c["sexo"] == "M" && c["experiencia"] == "S")
          .map((c) => c["idade"])
          .toList();
      double idadeMediaHomensExp =
          homensExp.isNotEmpty ? homensExp.reduce((a, b) => a + b) / homensExp.length : 0;

      int homens45 = candidatos
          .where((c) => c["sexo"] == "M" && c["idade"] > 45)
          .length;
      double percHomens45 = homens > 0 ? (homens45 / homens) * 100 : 0;

      int mulheresExp30 = candidatos
          .where((c) => c["sexo"] == "F" && c["idade"] < 30 && c["experiencia"] == "S")
          .length;

      var mulheresExp = candidatos
          .where((c) => c["sexo"] == "F" && c["experiencia"] == "S")
          .toList();
      String candidataJovem = mulheresExp.isNotEmpty
          ? mulheresExp.reduce((a, b) => a["idade"] < b["idade"] ? a : b)["nome"]
          : "Nenhuma candidata com experiência";

      print("\n===== RESULTADOS =====");
      print("a) Homens: $homens, Mulheres: $mulheres");
      print("b) Idade média dos homens com experiência: ${idadeMediaHomensExp.toStringAsFixed(2)}");
      print("c) % de homens com mais de 45 anos: ${percHomens45.toStringAsFixed(2)}%");
      print("d) Mulheres < 30 anos com experiência: $mulheresExp30");
      print("e) Candidata mais jovem com experiência: $candidataJovem");
      print("======================");

    } else if (opcao == "3") {
      print("Encerrando programa...");
      break;
    } else {
      print("Opção inválida, tente novamente.");
    }
  }
}