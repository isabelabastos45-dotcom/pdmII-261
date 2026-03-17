AVALIACAO-02

Implementar uma Pilha
1) Entender o funcionamento de uma Pilha;
2) Implementar o código para definir uma Pilha;
3) Implementar as funcionalidades:
a) Mostrar  topo da Pilha;
b) Empilhar;
c) Desempilhar;
d) Mostrar todos os elementos da Pilha.
e) Entregar o código e um print da execução.

class Pilhas {
  List<int> _dadosPilha = [];
  void empilhar(int valor) {
    _dadosPilha.add(valor);
    print("O objeto $valor foi empilhado");
  }
  void desempilhar() {
    if (_dadosPilha.isEmpty) {
      print("A pilha está vazia");
    } else {
      int removido = _dadosPilha.removeLast();
      print("O objeto $removido foi removido");
    }
  }
  void mostrarTopoPilha() {
    if (_dadosPilha.isEmpty) {
      print("A pilha está vazia");
    } else {
      print("O objeto ${_dadosPilha.last} está no topo da pilha");
    }
  }
  void mostrarPilha() {
    if (_dadosPilha.isEmpty) {
      print("A pilha está vazia");
    } else {
      print("Os objetos da pilha são");
      for (int i = _dadosPilha.length - 1; i >= 0; i--) {
        print(_dadosPilha[i]);
      }
    }
  }
}

void main() {
  Pilhas pilha = Pilhas();

  pilha.empilhar(10);
  pilha.empilhar(20);
  pilha.empilhar(30);

  pilha.mostrarPilha();

  pilha.mostrarTopoPilha();

  pilha.desempilhar();

  pilha.mostrarPilha();
}

