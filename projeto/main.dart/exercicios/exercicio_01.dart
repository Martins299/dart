
void main() {
  print('\n EXERCÍCIO 01: Cálculo de Preços de Bolos \n');

  const boloPrecos = {
    'ovos': 5.5,
    'chocolate': 7.5,
    'cenoura': 6.5,
  };

  const ordem = ['ovos', 'chocolate', 'limão'];

  double total = 0.0;

  print('Consultando preços dos ingredientes:\n');

  for (var bolo in ordem) {
    var preco = boloPrecos[bolo];
    
    if (preco != null) {
      print('✓ $bolo: R\$ ${preco.toStringAsFixed(2)}');
      total += preco;
    } else {
      print('✗ $bolo não está no cardápio');
    }
  }

  print('\n' + '-' * 50);
  print('Total = R\$ ${total.toStringAsFixed(2)}');
  print('-' * 50 + '\n');
}
