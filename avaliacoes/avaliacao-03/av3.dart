import 'dart:convert';

//dependente
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }
  
  Map<String, dynamic> toJson() {
  return {
    'nome': _nome,
  };
}
  
}

//funcionario
class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    _nome = nome;
    _dependentes = dependentes;
  }

  void adicionarDependente(Dependente dependente) {
    _dependentes.add(dependente);
  }

  void listarDependentes() {
    print('Dependentes de $_nome:');
    
    if (_dependentes.isEmpty) {
      print('Nenhum dependente cadastrado.');
    } else {
      for (var dep in _dependentes) {
        print('- ${dep._nome}');
      }
    }
  }
  
  Map<String, dynamic> toJson() {
  return {
    'nome': _nome,
    'dependentes': _dependentes.map((d) => d.toJson()).toList(),
  };
  }
}

//equipe projeto
class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }
  
  void listarFuncionarios() {
    print('Lista de funcionários do projeto $_nomeProjeto:');

    if (_funcionarios.isEmpty) {
      print('Nenhum funcionário cadastrado.');
    } else {
      for (var fun in _funcionarios) {
        print('- ${fun._nome}');
      }
    }
  }
  
  Map<String, dynamic> toJson() {
  return {
    'nomeProjeto': _nomeProjeto,
    'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
  };
}
}

void main() {

//funcionario 1
  var fun1 = Funcionario("João Silva", []);
  
  var dep1 = Dependente('Maria Silva');
  var dep2 = Dependente('Pedro Silva');
  var dep3 = Dependente('Fernando Silva');
  
  fun1.adicionarDependente(dep1);
  fun1.adicionarDependente(dep2);
  fun1.adicionarDependente(dep3);
  
 // funcionario 2
 var fun2 = Funcionario("Letícia Santos", []);
  
  var dep4 = Dependente('Loren Santos');
  var dep5 = Dependente('Joaquim Santos');
  var dep6 = Dependente('Carlos Santos');
  
  fun2.adicionarDependente(dep4);
  fun2.adicionarDependente(dep5);
  fun2.adicionarDependente(dep6);
  
//funcionario 3
 var fun3 = Funcionario("Jorge Castro", []);
  
  var dep7 = Dependente('José Castro');
  var dep8 = Dependente('Camila Castro');
  var dep9 = Dependente('Samira Castro');
  
  fun3.adicionarDependente(dep7);
  fun3.adicionarDependente(dep8);
  fun3.adicionarDependente(dep9);
  
//equipe e listagem de funcionarios
  var equipe1 = EquipeProjeto('Projeto A', [fun1, fun2, fun3]);
  equipe1.listarFuncionarios();
  
//listagem de dependentes
  fun1.listarDependentes();
  fun2.listarDependentes();
  fun3.listarDependentes();
  
//json
  var json = JsonEncoder.withIndent('  ').convert(equipe1);
  print(json);
}