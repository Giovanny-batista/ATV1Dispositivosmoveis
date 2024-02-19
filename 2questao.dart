import 'dart:io';

void main() {
  List<int> numeros = [];

  for (var i = 0; i < 10; i++) {
    stdout.write("Digite o ${i + 1}º número: ");
    var numero = int.parse(stdin.readLineSync()!);
    numeros.add(numero);
  }

  numeros.sort();

  var menorNumero = numeros.first;
  var contagemMenor = numeros.where((num) => num == menorNumero).length;

  print("Menor número: $menorNumero, Quantidade de vezes: $contagemMenor");

  var maiorNumero = numeros.last;
  var contagemMaior = numeros.where((num) => num == maiorNumero).length;

  print("Maior número: $maiorNumero, Quantidade de vezes: $contagemMaior");
}
