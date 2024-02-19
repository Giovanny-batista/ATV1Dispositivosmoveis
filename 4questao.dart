import 'dart:io';

class Aluno {
  String nome;
  double nota1;
  double nota2;

  Aluno(this.nome, this.nota1, this.nota2);

  double calcularMediaPonderada() {
    return (nota1 * 2 + nota2 * 3) / 5;
  }
}

void main() {
  List<Aluno> alunos = [];

  for (int i = 0; i < 8; i++) {
    stdout.write("Digite o nome do aluno ${i + 1}: ");
    var nome = stdin.readLineSync()!;

    stdout.write("Digite a primeira do aluno ${i + 1}: ");
    var nota1 = double.parse(stdin.readLineSync()!);

    stdout.write("Digite a segunda nota do aluno ${i + 1}: ");
    var nota2 = double.parse(stdin.readLineSync()!);

    alunos.add(Aluno(nome, nota1, nota2));
  }

  alunos.sort((a, b) =>
      b.calcularMediaPonderada().compareTo(a.calcularMediaPonderada()));

  // Listar alunos ordenados pela média ponderada
  print("\nAlunos ordenados pela média ponderada:");
  for (var aluno in alunos) {
    print(
        "Nome: ${aluno.nome}, Média Ponderada: ${aluno.calcularMediaPonderada()}");
  }

  alunos.sort((a, b) => a.nota1.compareTo(b.nota1));

  print("\nAlunos ordenados pela nota 1:");
  for (var aluno in alunos) {
    print("Nome: ${aluno.nome}, Nota 1: ${aluno.nota1}");
  }

  print("\nAlunos reprovados (média < 7) em ordem alfabética:");
  var alunosReprovados =
      alunos.where((aluno) => aluno.calcularMediaPonderada() < 7).toList();
  alunosReprovados.sort((a, b) => a.nome.compareTo(b.nome));

  for (var aluno in alunosReprovados) {
    print(
        "Nome: ${aluno.nome}, Média Ponderada: ${aluno.calcularMediaPonderada()}");
  }
}
