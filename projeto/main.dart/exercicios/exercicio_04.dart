import 'dart:io';

void main() {
    print('\n=== EXERCÍCIO 04: Gestão de Alunos ===\n');

    double somaMedias = 0;
    int totalAlunos = 0;
    int aprovados = 0;

    double maiorMediaM = -1;
    String matriculaMaiorM = "";

    double maiorMediaF = -1;
    String matriculaMaiorF = "";

    double somaMediasF = 0;
    int totalF = 0;

    while (true) {
      stdout.write("\nDigite a matrícula (00000 para encerrar): ");
      String matricula = stdin.readLineSync()!;

      if (matricula == "00000") break;

      stdout.write("Digite o nome: ");
      String nome = stdin.readLineSync()!;

      stdout.write("Digite o sexo (M/F): ");
      String sexo = stdin.readLineSync()!.toUpperCase();

      stdout.write("Digite a primeira nota: ");
      double n1 = double.parse(stdin.readLineSync()!);

      stdout.write("Digite a segunda nota: ");
      double n2 = double.parse(stdin.readLineSync()!);

      stdout.write("Digite a terceira nota: ");
      double n3 = double.parse(stdin.readLineSync()!);

      stdout.write("Digite o número de faltas: ");
      int faltas = int.parse(stdin.readLineSync()!);

      double media = (n1 + n2 + n3) / 3;
      somaMedias += media;
      totalAlunos++;

      bool aprovado = (media >= 7.0 && faltas <= 18);
      if (aprovado) {
        aprovados++;
      }

      if (sexo == "M" && media > maiorMediaM) {
        maiorMediaM = media;
        matriculaMaiorM = matricula;
      }

      if (sexo == "F") {
        totalF++;
        somaMediasF += media;
        if (media > maiorMediaF) {
          maiorMediaF = media;
          matriculaMaiorF = matricula;
        }
      }

      print('✓ Aluno registrado: $nome (Matrícula: $matricula) - Média: ${media.toStringAsFixed(2)}');
    }
    
    _exibirRelatorio(
      totalAlunos: totalAlunos,
      aprovados: aprovados,
      somaMedias: somaMedias,
      maiorMediaM: maiorMediaM,
      matriculaMaiorM: matriculaMaiorM,
      maiorMediaF: maiorMediaF,
      matriculaMaiorF: matriculaMaiorF,
      somaMediasF: somaMediasF,
      totalF: totalF,
    );
}

void _exibirRelatorio({
    required int totalAlunos,
    required int aprovados,
    required double somaMedias,
    required double maiorMediaM,
    required String matriculaMaiorM,
    required double maiorMediaF,
    required String matriculaMaiorF,
    required double somaMediasF,
    required int totalF,
  }) {
    print('\n' + '=' * 50);
    print('RELATÓRIO FINAL');
    print('=' * 50);

    if (totalAlunos == 0) {
      print('Nenhum aluno foi registrado!');
      return;
    }

    double mediaGeral = somaMedias / totalAlunos;
    double percentualAprovacao = (aprovados / totalAlunos) * 100;

    print('\nEstatísticas Gerais:');
    print('  • Total de alunos: $totalAlunos');
    print('  • Aprovados: $aprovados');
    print('  • Reprovados: ${totalAlunos - aprovados}');
    print('  • Percentual de aprovação: ${percentualAprovacao.toStringAsFixed(2)}%');
    print('  • Média geral: ${mediaGeral.toStringAsFixed(2)}');

    if (matriculaMaiorM.isNotEmpty) {
      print('\nMaior média (Masculino):');
      print('  • Matrícula: $matriculaMaiorM');
      print('  • Média: ${maiorMediaM.toStringAsFixed(2)}');
    }

    if (totalF > 0) {
      double mediaF = somaMediasF / totalF;
      print('\nEstatísticas (Feminino):');
      print('  • Total de alunas: $totalF');
      print('  • Média geral: ${mediaF.toStringAsFixed(2)}');
      if (matriculaMaiorF.isNotEmpty) {
        print('  • Maior média - Matrícula: $matriculaMaiorF (${maiorMediaF.toStringAsFixed(2)})');
      }
    }

    print('\n' + '=' * 50 + '\n');
}
