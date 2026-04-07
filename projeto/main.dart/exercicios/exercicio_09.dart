void main() {
  for (int n = 1000; n <= 9999; n++) {
    int parte1 = n ~/ 100;
    int parte2 = n % 100;
    int soma = parte1 + parte2;
    
    if (soma * soma == n) {
      print(n);
    }
  }
}