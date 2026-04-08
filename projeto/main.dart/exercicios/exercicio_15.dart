import 'dart:io';

class Boi {
  int numero;
  double peso;
  Boi(this.numero, this.peso);
  @override
  String toString() => 'Boi Nº $numero - Peso: $peso kg';
}

void main() {
  List<Boi> bois = [];

  while (true) {
    print('\n MENU INTERATIVO ');
    print('1 - Cadastrar boi');
    print('2 - Pesquisar bois por intervalo de peso');
    print('3 - Listar todos os bois');
    print('4 - Sair');
    stdout.write('Escolha uma opção: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('Digite o número do boi: ');
        int numero = int.parse(stdin.readLineSync()!);

        stdout.write('Digite o peso do boi: ');
        double peso = double.parse(stdin.readLineSync()!);

        bois.add(Boi(numero, peso));
        print('Boi cadastrado com sucesso!');
        break;

      case '2':
        stdout.write('Digite o peso mínimo: ');
        double min = double.parse(stdin.readLineSync()!);

        stdout.write('Digite o peso máximo: ');
        double max = double.parse(stdin.readLineSync()!);

        var filtrados = bois.where((b) => b.peso >= min && b.peso <= max).toList();

        if (filtrados.isEmpty) {
          print('Nenhum boi encontrado nesse intervalo.');
        } else {
          print('Bois encontrados:');
          filtrados.forEach(print);
        }
        break;

      case '3':
        if (bois.isEmpty) {
          print('Nenhum boi cadastrado.');
        } else {
          print('Lista de bois:');
          bois.forEach(print);
        }
        break;

      case '4':
        print('Encerrando programa...');
        return;

      default:
        print('Opção inválida, tente novamente.');
    }
  }
}