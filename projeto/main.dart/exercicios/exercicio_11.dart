import 'dart:io';

void main() {
  const double valorHora = 12.30;
  List<double> salariosHomens = [];
  List<double> salariosMulheres = [];

  while (true) {
    stdout.write("Digite o código do professor (9999 para encerrar): ");
    String codigo = stdin.readLineSync()!;

    if (codigo == '9999') break;

    stdout.write("Digite o nome do professor: ");
    String nome = stdin.readLineSync()!;
    stdout.write("Digite o sexo (M/F): ");
    String sexo = stdin.readLineSync()!.toUpperCase();
    stdout.write("Digite o número de horas de aula no mês: ");
    double horas = double.parse(stdin.readLineSync()!);
    double salarioBruto = horas * valorHora;
    double desconto = (sexo == 'M') ? 0.10 : 0.05;
    double salarioLiquido = salarioBruto * (1 - desconto);

    if (sexo == 'M') {
      salariosHomens.add(salarioLiquido);
    } else {
      salariosMulheres.add(salarioLiquido);
    }

    print("\n Dados do Professor ");
    print("Código: $codigo");
    print("Nome: $nome");
    print("Salário Bruto: R\$ ${salarioBruto.toStringAsFixed(2)}");
    print("Salário Líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}\n");
  }

  double mediaHomens = salariosHomens.isNotEmpty
      ? salariosHomens.reduce((a, b) => a + b) / salariosHomens.length
      : 0.0;

  double mediaMulheres = salariosMulheres.isNotEmpty
      ? salariosMulheres.reduce((a, b) => a + b) / salariosMulheres.length
      : 0.0;

  print("=== MÉDIAS DE SALÁRIOS LÍQUIDOS ===");
  print("Homens: R\$ ${mediaHomens.toStringAsFixed(2)}");
  print("Mulheres: R\$ ${mediaMulheres.toStringAsFixed(2)}");
}