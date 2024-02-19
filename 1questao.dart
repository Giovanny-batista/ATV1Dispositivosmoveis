import 'dart:io';

class Funcionario {
  String nome;
  double salario;

  Funcionario(this.nome, this.salario);
}

List<Funcionario> ordenarPorSalarioCrescente(List<Funcionario> funcionarios) {
  return funcionarios..sort((a, b) => a.salario.compareTo(b.salario));
}

List<Funcionario> ordenarPorSalarioDecrescente(List<Funcionario> funcionarios) {
  return funcionarios..sort((a, b) => b.salario.compareTo(a.salario));
}

List<Funcionario> ordenarPorNomeAlfabetico(List<Funcionario> funcionarios) {
  return funcionarios..sort((a, b) => a.nome.compareTo(b.nome));
}

void mostrarDados(List<Funcionario> funcionarios) {
  for (var funcionario in funcionarios) {
    print("Nome: ${funcionario.nome}, Salário: ${funcionario.salario}");
  }
}

void main() {
  List<Funcionario> funcionarios = [];

  for (var i = 1; i <= 5; i++) {
    stdout.write("Digite o nome do funcionário $i: ");
    var nome = stdin.readLineSync()!;

    stdout.write("Digite o salário do funcionário $i: ");
    var salario = double.parse(stdin.readLineSync()!);

    funcionarios.add(Funcionario(nome, salario));
  }

  print("\nSalário em ordem crescente:");
  mostrarDados(ordenarPorSalarioCrescente(funcionarios));

  print("\nSalário em ordem decrescente:");
  mostrarDados(ordenarPorSalarioDecrescente(funcionarios));

  print("\nEm ordem alfabética:");
  mostrarDados(ordenarPorNomeAlfabetico(funcionarios));
}
