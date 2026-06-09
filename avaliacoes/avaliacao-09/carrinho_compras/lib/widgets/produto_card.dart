import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';
import '../providers/carrinho_provider.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;

  const ProdutoCard({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(produto.nome),
        subtitle: Text(
          'R\$ ${produto.preco.toStringAsFixed(2)}',
        ),
        trailing: ElevatedButton(
          onPressed: () {
            context
                .read<CarrinhoProvider>()
                .adicionar(produto);
          },
          child: const Text('Adicionar'),
        ),
      ),
    );
  }
}