import 'package:flutter/material.dart';
import '../models/produto.dart';

class CarrinhoProvider extends ChangeNotifier {
  final List<Produto> _itens = [];

  List<Produto> get itens => _itens;

  void adicionar(Produto produto) {
    _itens.add(produto);
    notifyListeners();
  }

  void remover(Produto produto) {
    _itens.remove(produto);
    notifyListeners();
  }

  double get total {
    return _itens.fold(
      0,
      (soma, item) => soma + item.preco,
    );
  }

  int get quantidade => _itens.length;
}