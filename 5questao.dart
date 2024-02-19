import 'dart:io';

void main() {
  List<int> numeros = [];

  for (int i = 0; i < 15; i++) {
    var numero;
    do {
      stdout.write("Digite o ${i + 1}º número (não repetido): ");
      numero = int.parse(stdin.readLineSync()!);

      if (numeros.contains(numero)) {
        print("Número repetido. Tente novamente.");
      }
    } while (numeros.contains(numero));

    numeros.add(numero);
  }

  numeros.sort();

  print("\nNúmeros ordenados:");
  print(numeros);

  stdout.write("\nDigite um número para fazer a busca sequencial: ");
  var numeroBuscaSequencial = int.parse(stdin.readLineSync()!);
  var posicaoSequencial = numeros.indexOf(numeroBuscaSequencial);

  if (posicaoSequencial != -1) {
    print(
        "Número encontrado na posição $posicaoSequencial (0-index) usando busca sequencial.");
    print("A posição é ${posicaoSequencial.isEven ? 'par' : 'ímpar'}.");
  } else {
    print("Número não encontrado usando busca sequencial.");
  }

  stdout.write("\nDigite um número para fazer a busca binária: ");
  var numeroBuscaBinaria = int.parse(stdin.readLineSync()!);
  var posicaoBinaria = buscaBinaria(numeros, numeroBuscaBinaria);

  if (posicaoBinaria != -1) {
    print(
        "Número encontrado na posição $posicaoBinaria (0-index) usando busca binária.");
    print("A posição é ${posicaoBinaria.isEven ? 'par' : 'ímpar'}.");
  } else {
    print("Número não encontrado usando busca binária.");
  }
}

int buscaBinaria(List<int> lista, int alvo) {
  int inicio = 0;
  int fim = lista.length - 1;

  while (inicio <= fim) {
    int meio = (inicio + fim) ~/ 2;

    if (lista[meio] == alvo) {
      return meio;
    } else if (lista[meio] < alvo) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }

  return -1;
}
